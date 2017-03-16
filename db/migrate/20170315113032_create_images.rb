class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :file
      t.string :source_url
      t.integer :rating

      t.timestamps
    end
  end
end
