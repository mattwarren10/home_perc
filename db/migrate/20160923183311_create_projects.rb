class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :total_price
      t.integer :user_id

      t.timestamps
    end
  end
end
