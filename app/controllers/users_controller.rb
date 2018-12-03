class UsersController < ApplicationController

  def all
    @users = User.all
  end

  def perfil
  end

end
