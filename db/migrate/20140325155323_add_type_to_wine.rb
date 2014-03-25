class AddTypeToWine < ActiveRecord::Migration
  def change
    add_column :wines, :type, :string
  end
end
