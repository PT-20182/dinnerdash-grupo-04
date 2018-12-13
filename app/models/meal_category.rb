class MealCategory < ApplicationRecord
    validates :name, uniqueness: true, presence: true
    
    has_many :meals
end
