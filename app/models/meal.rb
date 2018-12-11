class Meal < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    validates :meal_category_id, presence: true

    belongs_to :meal_category

    has_many :order_meals
end
