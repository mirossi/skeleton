class CreateWineHasImages < ActiveRecord::Migration
  def change
    create_table :wine_has_images do |t|
      t.integer :wine_id
      t.integer :image_id
      t.timestamps
    end
  end
end
