class RemoveImageFilenameFromImage < ActiveRecord::Migration
  def change
    remove_column :images, :imageFilename
    add_column :images, :org_file, :string
    add_column :images, :med_file, :string
    add_column :images, :thumb_file, :string
  end
end
