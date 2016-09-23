class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :photo
      t.string :product_url
      t.string :description
      t.string :model_number
      t.integer :price

      t.timestamps
    end
  end
end
