class RemoveContactFromVines < ActiveRecord::Migration
  def change
    remove_column :vines, :contact, :integer
  end
end
