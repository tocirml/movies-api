class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :stock
      t.integer :rental_price
      t.integer :sale_price
      t.boolean :available

      t.timestamps
    end
  end
end
