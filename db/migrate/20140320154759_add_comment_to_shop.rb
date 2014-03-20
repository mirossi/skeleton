class AddCommentToShop < ActiveRecord::Migration
  def change
    add_column :shops, :comment, :string
  end
end
