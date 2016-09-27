class ChangePriceInProductsToEqualZero < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :price, :integer, default: 0
  end
end
