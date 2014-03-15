class ChangePersonHasContacty < ActiveRecord::Migration
  def change
    remove_column :person_has_contacts, :person
    remove_column :person_has_contacts, :contact
    add_column :person_has_contacts, :person_id, :integer
    add_column :person_has_contacts, :contact_id, :integer


  end
end
