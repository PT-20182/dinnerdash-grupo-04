class OrdersController < ApplicationController
  before_action :check_user_admin, except: [:create, :show]
  before_action :current_order, only: [:show, :edit, :update, :destroy]

  ORDERS_SIZE = 8

  def index
    @page = (params[:page] || 0).to_i
    @orders = Order.offset(ORDERS_SIZE * @page).limit(ORDERS_SIZE)
  end

  def create
    order_params = Hash.new
    order_params[:user_id] = current_user.id
    order_params[:situation_id] = 1
    order_params[:meals] = Meal.find(set_cart)
    order_params[:price] = params[:price]

    order = Order.create(order_params)
    
    if order.save
      session.delete(:cart)
    end
    
    redirect_to cart_path
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
    @meals = @order.meals
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

  def set_cart
		session[:cart] ||= []
	end
end
