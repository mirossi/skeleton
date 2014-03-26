class AddSUbregionToWine < ActiveRecord::Migration
  def change
    add_column :wines, :subregion_code, :string
  end
end
