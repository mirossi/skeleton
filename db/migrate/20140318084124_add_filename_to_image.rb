class AddFilenameToImage < ActiveRecord::Migration
  def change
    add_column :images, :imageFilename, :string
  end
end
