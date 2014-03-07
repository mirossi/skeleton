class AddContactToVines < ActiveRecord::Migration
  def change

    add_column :vines, :contact_id, :integer
 
  end
end
