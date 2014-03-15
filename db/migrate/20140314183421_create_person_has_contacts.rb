class CreatePersonHasContacts < ActiveRecord::Migration
  def change
    create_table :person_has_contacts do |t|
      t.integer :person
      t.integer :contact

      t.timestamps
    end
  end
end
