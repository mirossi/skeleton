class AddZipToContacs < ActiveRecord::Migration
  def change
    add_column :contacts, :zip, :integer
  end
end
