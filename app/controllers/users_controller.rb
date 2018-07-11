class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

      def show

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
         flash.now[:alert] = "User information was failed to update"
         render :action => :edit
       end
      end


  private

     def set_user
      @user = User.find(params[:id])
     end

     def user_params
       params.require(:user).permit(:name, :intro, :password)
     end

end
