class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :street
      t.integer :zipcode
      t.string :city
      t.integer :phone
      t.integer :country

      t.timestamps
    end
  end
end
