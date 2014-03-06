class RemoveUserIdFromContacs < ActiveRecord::Migration
  def change
    remove_column :contacts, :user_id, :integer
  end
end
