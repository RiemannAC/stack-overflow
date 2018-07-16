class Admin::QuestionsController < Admin::BaseController
  def index
    @questions = Question.page(params[:page]).per(7)
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      redirect_to admin_questions_path, notice: "Question has been deleted"
    else
      flash[:alert] = @question.errors.full_messages.to_sentence
      redirect_to admin_questions_path
    end
  end
end
