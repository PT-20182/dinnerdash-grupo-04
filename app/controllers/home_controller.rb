class HomeController < ApplicationController
  def index
      @meal_categories = MealCategory.all
      @meals = Meal.all
      @items = Meal.find(set_cart)
  end

  private

	def set_cart
		session[:cart] ||= []
	end
end
