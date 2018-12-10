class CreateMeals < ActiveRecord::Migration[5.2]
  def change
      create_table :meals do |t|
          t.string :name
          t.string :description
          t.string :price
          t.binary :image
          t.boolean :available
          t.references :meal_category

          t.timestamps
      end

  end
end
