class CreateShopSellsWines < ActiveRecord::Migration
  def change
    create_table :shop_sells_wines do |t|
      t.integer :wine_id
      t.integer :shop_id
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
