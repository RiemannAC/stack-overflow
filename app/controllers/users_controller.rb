class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @most_upvotes_question = @user.questions.order("question_upvotes_count DESC").first
    @most_upvotes_answer = @user.answers.order("answer_upvotes_count DESC").first
    @votes_questions = @user.questions.map(&:question_upvotes_count).sum
    @votes_answers = @user.answers.map(&:answer_upvotes_count).sum
    @votes_total = @votes_questions + @votes_answers
  end

  def edit
    unless @user == current_user
     redirect_to user_path(@user)
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User information was successfully updated"
      redirect_to user_path(@user)
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :action => :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :company, :title, :website, :twitter, :github)
  end

end
