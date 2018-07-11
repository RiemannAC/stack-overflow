class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :favorite, :unfavorite]

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

      def favorites
        @favorited_posts = @user.favorited_posts.includes(:favorited_users)
      end



  private

     def set_user
      @user = User.find(params[:id])
     end

     def user_params
       params.require(:user).permit(:name, :intro, :password)
     end

end
