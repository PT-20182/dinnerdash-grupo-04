class RemoveAdminFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :admin, :integer
  end
end
