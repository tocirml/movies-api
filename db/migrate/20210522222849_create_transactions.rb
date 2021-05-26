class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :customer_email
      t.string :price

      t.timestamps
    end
  end
end
