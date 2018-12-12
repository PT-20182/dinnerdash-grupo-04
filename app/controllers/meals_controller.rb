class MealsController < ApplicationController
  before_action :check_user_admin
  before_action :current_meal, only: [:edit, :update, :destroy]
  before_action :meal_category, only: [:new, :edit]
  before_action :is_any_meal_category?, only: [:new]
  before_action :set_page, only: [:index]


  MEALS_PER_PAGE = 8

  def index
      @meals = Meal.order(:id).limit(MEALS_PER_PAGE).offset(@page * MEALS_PER_PAGE)
  end

  def new
      @meal = Meal.new
  end

  def create
    meal = Meal.create(meal_params)

    if meal.save
      redirect_to meals_path
    else
      alert = []

      if meal_params[:name].blank?  
        alert << "Nome não pode estar em branco"
      end
      if meal_params[:price].blank?
        alert << "Preço não pode estar em branco"
      
      elsif meal_params[:price].to_d < 0
        alert << "Preço não pode ser negativo"
      end

      redirect_to new_meal_path, alert: alert
    end

  end

  def edit
    
  end

  def update
    if @meal.update(meal_params)
      redirect_to meals_path
    else
      alert = []

      if meal_params[:name].blank?  
        alert << "Nome não pode estar em branco"
      end
      if meal_params[:price].blank?
        alert << "Preço não pode estar em branco"
      
      elsif meal_params[:price].to_d < 0
        alert << "Preço não pode ser negativo"
      end

      redirect_to edit_meal_path(@meal), alert: alert
    end
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

 def is_any_meal_category?
    if MealCategory.count == 0
      redirect_to meals_path, alert: "Não é possível criar refeições sem categorias existentes" 
    end
 end

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
