class AddToShops < ActiveRecord::Migration
  def change
   add_column :shops, :user_id, :integer
    remove_column :shops, :country
    add_column :shops, :country_code , :string
  end
end
