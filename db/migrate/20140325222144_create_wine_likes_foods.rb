class CreateWineLikesFoods < ActiveRecord::Migration
  def change
    create_table :wine_likes_foods do |t|
      t.integer :wine_id
      t.integer :food_id

      t.timestamps
    end
  end
end
