class MealsController < ApplicationController
  before_action :current_meal, only: [:edit, :update, :destroy]
  before_action :set_page, only: [:index]
  before_action :meal_category, only: [:new, :edit]
  before_action :check_user_admin


  MEALS_PER_PAGE = 8

  def index
      @meals = Meal.order(:id).limit(MEALS_PER_PAGE).offset(@page * MEALS_PER_PAGE)
  end

  def new
      @meal = Meal.new
  end

  def create
    meal = Meal.create(meal_params)

    redirect_to meals_path
  end

  def edit

  end

  def update
    @meal.update(meal_params)

    redirect_to meals_path
 end

 def upload
     uploaded_io = params[:image]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
     file.write(uploaded_io.read)
    end
 end

 def destroy
     @meal.destroy

     redirect_to meals_path
 end


 private

 def meal_params
    params.require(:meal).permit(:name, :meal_category_id, :description, :price, :image, :available)
 end

 def current_meal
    @meal = Meal.find(params[:id])
 end

 def set_page
     @page = params[:page].to_i || 1
 end

 def meal_category
    @meal_categories = MealCategory.all
 end
 

end
