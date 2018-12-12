class CartController < ApplicationController
	def show
		@items = Meal.find(session[:cart])
	end 
	
	def add_item
		@item = params[:id]
		set_cart.push(@item)    
   		redirect_to root_path
	end
	
	def remove_item
		@item = params[:id]
		set_cart.delete(@item)
		redirect_to root_path
	end

	private

	def set_cart
		session[:cart] ||= []
	end
end
