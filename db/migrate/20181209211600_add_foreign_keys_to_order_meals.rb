class AddForeignKeysToOrderMeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_meals, :order
    add_reference :order_meals, :meal
  end
end
