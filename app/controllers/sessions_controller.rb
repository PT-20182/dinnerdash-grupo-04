class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to user_path(user)
      # Log the user in and redirect to the user's show page.
    else
      flash[:danger] = 'E-mail ou senha inválidos' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end
end
