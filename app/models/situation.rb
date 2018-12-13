class Situation < ApplicationRecord
    validates :description, uniqueness:  true, presence: true

    has_many :orders
    has_many :order_meals, :through =>:orders
end
