class CreateImages < ActiveRecord::Migration
  def change

    create_table :images do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end

    add_attachment :images, :picture
  end
end
