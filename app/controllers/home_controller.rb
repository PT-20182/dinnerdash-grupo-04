class HomeController < ApplicationController
  def index
      @meal_categories = MealCategory.all
      @meals = Meal.all
  end
end
