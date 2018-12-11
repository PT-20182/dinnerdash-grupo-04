class Meal < ApplicationRecord
    belongs_to :meal_category

    has_one_attached :image

    has_many :order_meals
end
