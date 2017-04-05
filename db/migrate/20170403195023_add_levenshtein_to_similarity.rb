class AddLevenshteinToSimilarity < ActiveRecord::Migration[5.0]
  def change
    add_column :similarities, :levenshtein, :integer
  end
end
