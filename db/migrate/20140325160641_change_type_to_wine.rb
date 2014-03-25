class ChangeTypeToWine < ActiveRecord::Migration
  def change
        remove_column :wines, :type, :string
    add_column :wines, :wine_type, :string
  end
end
