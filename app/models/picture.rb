class Picture < ApplicationRecord
  has_attached_file :file,
                    :styles => { :thumb => "200x200" },
                    :path => ":rails_root/app/assets/images/:basename.:extension"
  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/webp"]
  validates :source_url,
            format: {
                :with => URI::regexp(%w(http https)), :message => "Valid URL required"
            }
end
