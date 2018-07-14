class QuestionsController < ApplicationController
  def index
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

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
