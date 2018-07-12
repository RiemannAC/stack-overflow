class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(20)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path, notice: "User has been deleted"
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      redirect_to admin_users_path
    end
  end
end
