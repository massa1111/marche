class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_non_current_user, except: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

  def redirect_non_current_user
    return if current_user == User.find(params[:id])

    redirect_to root_path
  end
end
