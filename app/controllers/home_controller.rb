class HomeController < ApplicationController
  def index
      @meal_categories = MealCategory.all
      @meals = Meal.all
      @items = Meal.find(set_cart)

      @total_price = 0

      @items.each do |meal|
        @total_price = @total_price + meal.price
      end
  end

  private

	def set_cart
		session[:cart] ||= []
	end
end
