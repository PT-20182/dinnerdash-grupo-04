class MealCategoriesController < ApplicationController
  before_action :current_meal_category, only: [:edit, :update, :destroy]
  before_action :check_user_admin

  def index
      @meal_categories = MealCategory.all
  end

  def new
      @meal_category = MealCategory.new
  end

  def create
      meal_category = MealCategory.create(meal_category_params)

      redirect_to meal_categories_path
  end

  def edit

  end

  def update
      @meal_category.update(meal_category_params)

      redirect_to meal_categories_path
  end

  def destroy
      @meal_category.destroy

      redirect_to meal_categories_path
  end

  private

  def meal_category_params
      params.require(:meal_category).permit(:name)
  end

  def current_meal_category
      @meal_category = MealCategory.find(params[:id])
  end

end
