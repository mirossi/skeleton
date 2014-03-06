class RenamePersontouser < ActiveRecord::Migration
  def change
    rename_column :people, :user,:user_id
    rename_column :people, :contact,:contact_id
  end
end
