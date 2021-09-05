class HomeController < ApplicationController
  def index
    @recipes = Recipe.includes(:user,:favorites).order(created_at: :desc).limit(5)
  end
end
