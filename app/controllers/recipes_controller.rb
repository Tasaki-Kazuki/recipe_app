class RecipesController < ApplicationController
  before_action :signed_in_user, only: :new
  before_action :own_recipe, only: [:edit, :update, :destroy]
  def index
    @recipes = Recipe.page(params[:page]).per(10).reverse_order
  end

  def new
    # @recipe=current_user.recipes.build(recipe_params)
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    @recipe.save

    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe_params_id
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "レシピの編集を成功しました"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
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

  def recipe_params
    params.require(:recipe).permit(:title, :body, :season)
  end

  def recipe_params_id
    params.require(:id)
  end
end
