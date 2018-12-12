class Meal < ApplicationRecord
    validates_presence_of :name, :price, :meal_category_id
    validates :price, numericality: {:greater_than_or_equal_to => 0}

    belongs_to :meal_category

    has_many :order_meals
end
