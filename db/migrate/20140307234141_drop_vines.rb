class DropVines < ActiveRecord::Migration
  def change
    drop_table :vines
  end
end
