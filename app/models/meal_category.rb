class MealCategory < ApplicationRecord
    validates :name, uniqueness:  true, presence: true
end
