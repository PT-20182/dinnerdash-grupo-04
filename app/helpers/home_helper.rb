module HomeHelper
    def query_meals(meal_category_name)
        @meals = Meal.joins(:meal_category).where("meals.available = true
                                                  AND meals.meal_category_id = meal_categories.id
                                                  AND meal_categories.name = ?", meal_category_name)
    end
end
