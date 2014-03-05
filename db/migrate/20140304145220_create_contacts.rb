class CreateContacts < ActiveRecord::Migration
def up
create_table :contacts do |t|

t.string :mobile , :null => false, :default => ""
t.string :address , :null => false, :default => ""
t.integer :user_id

end

end

def down
drop_table :contacts

end
end