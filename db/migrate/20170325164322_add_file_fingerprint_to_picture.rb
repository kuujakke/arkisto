class AddFileFingerprintToPicture < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :file_fingerprint, :string
    add_column :pictures, :file_fingerprint_bits, 'bit varying(255)'
  end
end
