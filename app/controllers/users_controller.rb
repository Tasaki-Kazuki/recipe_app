class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # https://railsguides.jp/action_controller_overview.html
    user_params_id
    @user = User.find(params[:id])
    # ここにnilが渡ってきてNot Foundのエラーが来る可能性があることに配慮したコードである必要がある
  end

  def edit
    user_params_id
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      flash[:danger] = "他のユーザーの情報は変更できません"
      redirect_to "/"
    end
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
