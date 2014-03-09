class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :name
      t.integer :maxage

      t.timestamps
    end
  end
end
