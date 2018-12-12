class Meal < ApplicationRecord
    validates_presence_of :name, :price, :meal_category_id
    validates :price, numericality: {:greater_than_or_equal_to => 0}

    belongs_to :meal_category

    def image_attachment_path
        image.attached? ? image : 'miojo.png'
    end

    has_one_attached :image

    has_and_belongs_to_many :orders
end
