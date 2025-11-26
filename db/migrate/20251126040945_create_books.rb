class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
