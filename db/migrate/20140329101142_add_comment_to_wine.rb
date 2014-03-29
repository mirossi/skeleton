class AddCommentToWine < ActiveRecord::Migration
  def change
    add_column :wines, :comment, :string
  end
end
