class UsersController < ApplicationController
  before_action :current_user_by_id, only: [:edit, :update, :destroy]
  before_action :check_user_admin, except: [:show]

  USERS_SIZE = 8

  def index
    @page = (params[:page] || 0).to_i
    @users = User.offset(USERS_SIZE * @page).limit(USERS_SIZE)
  end

  def edit

  end

  def show
      @user = User.includes(:orders).find(current_user.id)
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      alert = []

      if user_params[:name].blank?
        alert << "Nome não pode estar em branco"
      end
      if user_params[:email].blank?
        alert << "Email não pode estar em branco"
      end

      redirect_to edit_user_path(@user), alert: alert
    end
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
