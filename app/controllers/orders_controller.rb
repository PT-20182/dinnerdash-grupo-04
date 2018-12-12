class OrdersController < ApplicationController
  before_action :check_user_admin
  before_action :current_order, only: [:edit, :update, :destroy]

  ORDERS_SIZE = 8

  def index
    @page = (params[:page] || 0).to_i
    @orders = Order.offset(ORDERS_SIZE * @page).limit(ORDERS_SIZE)
  end

  def edit
    @situations = Situation.all
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path
    else
      redirect_to edit_order_path(@order)
    end
  end

  def show
      
  end

  def destroy
    @order.destroy

    redirect_to orders_path
  end

  private

  def current_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:situation_id)
  end
end
