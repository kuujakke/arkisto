class CreateSimilarities < ActiveRecord::Migration[5.0]
  def change
    create_table :similarities do |t|
      t.decimal :hamming
      t.integer :picture_id
      t.integer :similar_id
      t.timestamps
    end
  end
end
