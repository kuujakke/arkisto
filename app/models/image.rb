class Image < ApplicationRecord
  validates :source_url,
            presence: true,
            format: {
                :with => URI::regexp(%w(http https)), :message => "Valid URL required"
            }
  validates :file,
            presence: true
end
