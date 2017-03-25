class AddFileFingerprintToPicture < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :file_fingerprint, :string
  end
end
