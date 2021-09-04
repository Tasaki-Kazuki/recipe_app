class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(20)
  end

  def show
    # https://railsguides.jp/action_controller_overview.html
    user_params_id
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page]).per(10).reverse_order
    # ここにnilが渡ってきてNot Foundのエラーが来る可能性があることに配慮したコードである必要がある
  end

  def edit
    user_params_id
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to "/"
      return
    end
    render "edit"
  end

  def update
    user_params_id
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
      # 更新に成功した場合を扱う。
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_params_id
    params.require(:id)
  end
end
