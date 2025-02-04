class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :detail
      t.string :sku

      t.timestamps
    end
  end
end
