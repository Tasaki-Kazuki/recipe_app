class RecipesController < ApplicationController
  def index
    @recipes = Recipe.page(params[:page]).per(10)
  end

  def new
    # @recipe=current_user.recipes.build(recipe_params)
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
    # @recipe.user_id=current_user.id
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe_params_id
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "レシピの編集を成功しました"
      redirect_to recipes_path
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
end

private

def recipe_params
  params.require(:recipe).permit(:title, :body)
end

def recipe_params_id
  params.require(:id)
end
