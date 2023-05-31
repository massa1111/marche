class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報が更新されました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)  # 編集可能なパラメータを指定してください
  end

end
