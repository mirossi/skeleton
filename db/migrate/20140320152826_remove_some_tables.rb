class RemoveSomeTables < ActiveRecord::Migration
  def change
    drop_table :animals
    drop_table :trees
    
  end
end
