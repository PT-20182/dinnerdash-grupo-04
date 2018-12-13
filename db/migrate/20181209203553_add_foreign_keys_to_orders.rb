class AddForeignKeysToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :user
    add_reference :orders, :situation
  end
end
