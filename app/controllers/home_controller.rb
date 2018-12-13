class HomeController < ApplicationController
  def index
      @meal_categories = MealCategory.all
      @meals = Meal.all
<<<<<<< HEAD
      @items = Meal.find(set_cart)
=======
      @items = Meal.find(session[:cart])
>>>>>>> responsive_button
  end

  private

	def set_cart
		session[:cart] ||= []
	end
end
