class FavoritesController < ApplicationController
before_action :signed_in_user, only: [:create,:destroy]


    def create
        @favorite = current_user.favorites.create(recipe_id: params[:recipe_id])
        redirect_back fallback_location:"root_path"
    end

    def destroy
        @recipe = Recipe.find(params[:recipe_id])
        @favorite = current_user.favorites.find_by(recipe_id:@recipe.id)
        @favorite.destroy
        redirect_back fallback_location:"root_path"

    end

    

    private

    def signed_in_user
        unless user_signed_in?
          flash[:danger] = "Please log in."
          redirect_to sign_in_path
        end
      end

    
end
