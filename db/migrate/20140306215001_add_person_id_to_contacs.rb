class AddPersonIdToContacs < ActiveRecord::Migration
  def change
    add_column :contacts, :person_id, :integer
  end
end
