class RemoveContactFromPerson < ActiveRecord::Migration
  def change
   # remove_column :people, :contact_id
   # add_column :people, :person_has_contacts_id, :integer
    remove_column :contacts, :person_id
    add_column :contacts, :person_has_contacts_id, :integer



  end
end
