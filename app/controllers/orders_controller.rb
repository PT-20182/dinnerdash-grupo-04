class OrdersController < ApplicationController
  before_action :check_user_admin
  
  ORDERS_SIZE = 8

  def index
    @page = (params[:page] || 0).to_i
    @orders = Order.offset(ORDERS_SIZE * @page).limit(ORDERS_SIZE)
  end

  def edit
  end

  def show
  end
end
