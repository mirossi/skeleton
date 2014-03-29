class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.decimal :rating
      t.integer :user_id
      t.string :comment

      t.timestamps
    end
  end
end
