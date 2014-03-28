class AddPrecision < ActiveRecord::Migration
  def change
    change_column :shop_sells_wines, :price, :decimal, :precision => 10 , :scale => 2
  end
end
