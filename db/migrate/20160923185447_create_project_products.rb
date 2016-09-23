class CreateProjectProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :project_products do |t|
      t.integer :project_id
      t.integer :product_id

      t.timestamps
    end
  end
end
