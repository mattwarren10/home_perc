class AddMerchantToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :merchant, :string
  end
end
