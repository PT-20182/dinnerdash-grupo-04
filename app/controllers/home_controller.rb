class HomeController < ApplicationController
  def index
      @meal_categories = MealCategory.all
      @meals = Meal.all
  end

  def show
    @user = User.includes(:orders).find(current_user.id)
  end
end
