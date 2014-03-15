class RemoveIdFromPersonAndContact < ActiveRecord::Migration
  def change
    remove_column :contacts, :person_has_contacts_id
    remove_column :people, :person_has_contacts_id
  end
end
