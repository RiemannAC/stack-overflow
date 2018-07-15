class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      flash[:notice] = "Answer created"
    else
      flash[:alert] = @answer.errors.full_messages.to_sentence
    end
    redirect_back(fallback_location: questions_path)
  end

  def answer_upvote
    @answer = Answer.find(params[:id])
    @answer.answer_upvotes.create!(user:current_user)
    @answer.save
    redirect_back(fallback_location: question_path)  
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
