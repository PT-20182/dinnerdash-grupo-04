class UsersController < ApplicationController

  def all
    @users = User.all
  end

end
