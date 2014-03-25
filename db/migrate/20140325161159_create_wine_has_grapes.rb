class CreateWineHasGrapes < ActiveRecord::Migration
  def change
    create_table :wine_has_grapes do |t|
      t.integer :wine_id
      t.integer :grape_id

      t.timestamps
    end
  end
end
