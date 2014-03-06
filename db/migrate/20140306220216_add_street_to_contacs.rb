class AddStreetToContacs < ActiveRecord::Migration
  def change
    add_column :contacts, :street, :string
  end
end
