class AddWinetoRating < ActiveRecord::Migration
  def change
    add_column :ratings, :wine_id, :integer
  end
end
