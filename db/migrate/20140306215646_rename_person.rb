class RenamePerson < ActiveRecord::Migration
  def change
    rename_column :people, :name,:lastname
  end
end
