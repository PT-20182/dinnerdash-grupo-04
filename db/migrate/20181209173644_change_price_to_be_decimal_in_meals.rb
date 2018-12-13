class ChangePriceToBeDecimalInMeals < ActiveRecord::Migration[5.2]
  # Using 'up' and 'down' to simplify a rollback

  def up # Rails will use this with a 'db:migrate'
    change_column :meals, :price, 'decimal USING CAST(price AS decimal)'  # Needed for PSQL reasons
  end

  def down # Rails will use this, instead, with a 'db:rollback'
    change_column :meals, :price, :string
  end
end
