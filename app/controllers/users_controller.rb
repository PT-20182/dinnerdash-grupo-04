class UsersController < ApplicationController
  before_action :current_user, only: [:show]

  def all
    @users = User.all
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def current_user
    @user = User.find(params[:format])
  end

end
