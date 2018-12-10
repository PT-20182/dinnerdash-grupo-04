class MealCategoriesController < ApplicationController
  before_action :current_meal_category, only: [:edit, :update, :destroy]
  before_action :check_user_admin

  MEAL_CATEGORIES_SIZE = 8

  def index
      @page = (params[:page] || 0).to_i
      @meal_categories = MealCategory.offset(MEAL_CATEGORIES_SIZE * @page).limit(MEAL_CATEGORIES_SIZE)
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
