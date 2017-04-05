class Similarity < ApplicationRecord
  belongs_to :picture, class_name: 'Picture'
  belongs_to :similar, class_name: 'Picture'
  validates :picture, presence: true, uniqueness: { scope: :similar }
  validates :hamming, presence: true
  validates :levenshtein, presence: true
end
