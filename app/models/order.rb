class Order < ApplicationRecord
    belongs_to :user
    belongs_to :situation

    has_and_belongs_to_many :meals
end
