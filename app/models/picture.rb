class Picture < ApplicationRecord
  has_attached_file :file,
                    styles: {
                        tiny:          { geometry: '50x50#', format: :webp },
                        thumbnail:     { geometry: '200x200#', format: :webp },
                        large:         { geometry: '1024x680>', format: :webp },
                        original:      { geometry: '1920x1680>', format: :webp, convert_options: '' }
                    },
                    :path => ":rails_root/public/system/:class/:id/:basename-:style.:extension",
                    :url => "/system/:class/:id/:basename-:style.:extension"
  validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/webp"]
#  validates :source_url,
 #           format: {
  #              :with => URI::regexp(%w(http https)), :message => "Valid URL required"
   #         }
end
