class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :favorite, :unfavorite]

  def index
    @questions = Question.order("created_at desc").page(params[:page]).per(15)
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      flash[:notice] = "Question created"
    else
      flash[:alert] = @question.errors.full_messages.to_sentence
    end
    redirect_back(fallback_location: questions_path)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def favorite
    @question.favorites.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    favorites = Favorite.where(question: @question, user: current_user)
    favorites.destroy_all
    redirect_back(fallback_location: root_path)
  end

  private

  def set_question
   @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
