class PostsController < ApplicationController
before_action :set_post, only: [:favorite, :unfavorite]

   def favorite
     @post.favorites.create!(user: current_user)
     redirect_back(fallback_location: root_path)
   end

   def unfavorite
     favorites = Favorite.where(post: @post, user: current_user)
     favorites.destroy_all
     redirect_back(fallback_location: root_path)
   end
end
