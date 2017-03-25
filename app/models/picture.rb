class Picture < ApplicationRecord
  has_attached_file :file,
                    styles: {
                        tiny:          { geometry: '75x75!', format: :webp, :processors => [:liquid] },
                        thumbnail:     { geometry: '250x250!', format: :webp, :processors => [:liquid] },
                        large:         { geometry: '1024x680>', format: :webp },
                        original:      { geometry: '1920x1680>', format: :webp, convert_options: '' }
                    },
                    convert_options: {
                        all: '-strip',
                    },
                    :path => ":rails_root/public/system/:class/:id/:basename-:style.:extension",
                    :url => "/system/:class/:id/:basename-:style.:extension"
  before_validation :perceptual_hash, :if => :valid_type?
  validates_attachment_presence :file
  validates_attachment_content_type :file, :content_type => /image/
  validates :file_fingerprint, uniqueness: { message: "is not unique!" }

  private

  def valid_type?
    file.content_type =~ /image/
  end

  def perceptual_hash
    return unless file?
    original = file.queued_for_write[:original]
    unless original.nil?
      self.file_fingerprint = Phashion.image_hash_for original.path
      self.file_fingerprint_bits = self.file_fingerprint.to_s.unpack("B*")[0]
    end
  end

#  validates :source_url,
 #           format: {
  #              :with => URI::regexp(%w(http https)), :message => "Valid URL required"
   #         }
end
