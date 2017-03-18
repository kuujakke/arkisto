class Picture < ApplicationRecord
  has_image :resize_to => "640x480",
            :thumbnails => {
                :square => "200x200"
            }
  validates :source_url,
            presence: true,
            format: {
                :with => URI::regexp(%w(http https)), :message => "Valid URL required"
            }
  validates :file,
            presence: true
end
