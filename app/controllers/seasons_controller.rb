class SeasonsController < ApplicationController
    before_action :signed_in_user, only: :create
    before_action :own_recipe, only: [:edit, :update, :destroy]
    def create
        @season = @recipe.build_season
    end

    def update
        @season = @recipe.build_season
    end

    def edit
    end

   

    def destroy
    end


private

def signed_in_user
  unless user_signed_in?
    flash[:danger] = "Please log in."
    redirect_to sign_in_path
  end
end

def own_recipe
  @recipe = Recipe.find(params[:id])
  unless @recipe.user == current_user
    redirect_to "/"
  end
end

end
