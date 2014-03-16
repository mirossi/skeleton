class ChangeVine < ActiveRecord::Migration
  def change
    remove_column :wines, :country_code
    add_column :wines, :country_code, :string
  end
end
