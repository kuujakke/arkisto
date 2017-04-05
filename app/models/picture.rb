class Picture < ApplicationRecord
  has_many :similarities, :dependent => :destroy, :source => :similarity
  has_many :similar_pictures, :through => :similarities, source: :similar
  accepts_nested_attributes_for :similarities
  has_attached_file :file,
                    styles: {
                        tiny: {geometry: '75x75!', format: :webp, :processors => [:liquid]},
                        thumbnail: {geometry: '250x250!', format: :webp, :processors => [:liquid]},
                        large: {geometry: '1024x680>', format: :webp},
                        original: {geometry: '1920x1680>', format: :webp, convert_options: ''}
                    },
                    convert_options: {
                        all: '-strip',
                    },
                    :path => ":rails_root/public/system/:class/:id/:basename-:style.:extension",
                    :url => "/system/:class/:id/:basename-:style.:extension"
  before_validation :perceptual_hash, :if => :valid_type?
  validates_attachment_presence :file
  validates_attachment_content_type :file, :content_type => /image/
  validates :file_fingerprint, uniqueness: {message: "is not unique!"}

  def self.get_similar(picture)
    similar = self.connection.select_all("SELECT id, hamming('#{picture.file_fingerprint_bits}', file_fingerprint_bits) AS hamming, levenshtein('#{picture.file_fingerprint}', file_fingerprint) AS levenshtein FROM pictures")
    similar.rows
  end

  def update_similar
    distances = Picture.get_similar(self)
    distances.each do |distance|
      unless distance[0] == self.id
        similarity = Similarity.find_or_create_by(picture_id: self.id, similar_id: distance[0])
        similarity.hamming = distance[1]
        similarity.levenshtein = distance[2]
        similarity.save!
      end
    end
  end

  def perceptual_hash
    return unless file?
    original = file.queued_for_write[:original]
    unless original.nil?
      self.file_fingerprint = Phashion.image_hash_for original.path
      self.file_fingerprint_bits = self.file_fingerprint.to_s.unpack("B*")[0]
    end
  end

  private

  def valid_type?
    file.content_type =~ /image/
  end


#  validates :source_url,
#           format: {
#              :with => URI::regexp(%w(http https)), :message => "Valid URL required"
#         }
end
