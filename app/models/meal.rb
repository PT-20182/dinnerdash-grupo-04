class Meal < ApplicationRecord
    belongs_to :meal_category

    has_many :order_meals
end
