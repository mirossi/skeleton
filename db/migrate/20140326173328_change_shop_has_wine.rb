class ChangeShopHasWine < ActiveRecord::Migration
  def change
    remove_column :shop_sells_wines, :price, :string
    add_column :shop_sells_wines, :price, :decimal
  end
end
