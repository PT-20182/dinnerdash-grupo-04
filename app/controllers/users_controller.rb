class UsersController < ApplicationController
  before_action :current_user_by_id, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def edit

  end

  def update
    @user.update(user_params)

    redirect_to users_path(@user)
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin)
  end

  def current_user_by_id
    @user = User.find(params[:id])
  end

end