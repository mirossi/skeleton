class AddHomepageToShops < ActiveRecord::Migration
  def change
    add_column :shops, :homepage, :string
  end
end
