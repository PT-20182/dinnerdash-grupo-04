class CartController < ApplicationController
	def show
		@items = Meal.find(set_cart)
		@user = User.includes(:orders).find(current_user.id)
		@meal_categories = MealCategory.all

		@total_price = 0

		@items.each do |meal|
			@total_price = @total_price + meal.price
		end
	end

	def add_item
		@item = params[:id]
		set_cart.push(@item)

   		redirect_to root_path
	end

	def remove_item
		@item = params[:id]
		set_cart.delete(@item)

		redirect_to request.referrer
	end

	private

	def set_cart
		session[:cart] ||= []
	end
end
