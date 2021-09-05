class FavoritesController < ApplicationController
  before_action :signed_in_user, only: [:index, :create, :destroy]

  def index
    current_user_favorites = Favorite.where(user_id: current_user.id).pluck(:recipe_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorites_list = Recipe.where(id: current_user_favorites).includes(:user).page(params[:page]).per(10)
  end

  def create
    @favorite = current_user.favorites.create(recipe_id: params[:recipe_id])
    redirect_back fallback_location: "root_path"
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    @favorite.destroy
    redirect_back fallback_location: "root_path"
  end

  private

  def signed_in_user
    unless user_signed_in?
      flash[:danger] = "Please log in."
      redirect_to sign_in_path
    end
  end
end
