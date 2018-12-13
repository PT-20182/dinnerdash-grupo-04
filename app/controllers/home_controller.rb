class HomeController < ApplicationController
  def index
      @meal_categories = MealCategory.all
      @meals = Meal.all
      @items = Meal.find(session[:cart])
  end
end
