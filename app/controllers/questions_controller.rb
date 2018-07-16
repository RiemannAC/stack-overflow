class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :question_upvote, :favorite, :unfavorite]

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

  def question_upvote
    @question = Question.find(params[:id])
    @question.question_upvotes.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def favorite
    @question = Question.find(params[:id])
    @question.favorites.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    @question = Question.find(params[:id])
    favorite = Favorite.where(question: @question, user: current_user).first
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
