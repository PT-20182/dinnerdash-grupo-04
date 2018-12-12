class CreateOrdersMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_meals, id: false do |t|
      t.integer :quantity

      t.belongs_to :order, index: true
      t.belongs_to :meal, index: true

      t.timestamps
    end
  end
end
