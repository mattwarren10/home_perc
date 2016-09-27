class ChangeProjectPrice < ActiveRecord::Migration[5.0]
  def change
  	  	change_column :projects, :total_price, :integer, default: 0
  end
end
