class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # https://railsguides.jp/action_controller_overview.html
    user_params
    @user = User.find(params[:id]) # ここにnilが渡ってきてNot Foundのエラーが来る可能性があることに配慮したコードである必要がある
  end

  private

  def user_params
    params.require(:id)
  end
end
