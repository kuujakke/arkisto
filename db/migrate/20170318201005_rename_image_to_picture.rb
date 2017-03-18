class RenameImageToPicture < ActiveRecord::Migration[5.0]
  def change
    rename_table :images, :pictures
  end
end
