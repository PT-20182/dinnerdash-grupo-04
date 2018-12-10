class OrderMeal < ApplicationRecord
    belongs_to :order
    belongs_to :meal
    
    has_one :situation, :through =>:order
end