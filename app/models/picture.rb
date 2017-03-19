class Picture < ApplicationRecord
  attr_accessible :file
  has_attached_file :file, :styles => { :thumb => "200x200" }
  validates :source_url,
            presence: true,
            format: {
                :with => URI::regexp(%w(http https)), :message => "Valid URL required"
            }
  validates :file,
            presence: true
end
