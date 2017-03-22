require 'rails_helper'

RSpec.describe Picture, type: :model do
  describe "with valid parameters" do
    let(:picture) { FactoryGirl.create(:picture, source_url: "https://asd.asd.com/1231.jpg") }

    it "should be saved" do
      expect(picture).to be_valid
    end
  end
  describe "with invalid parameters" do
    it "should not be saved" do
      picture = Picture.new file: fixture_file_upload(Rails.root.join('spec', 'pictures', 'test.txt'), 'image/jpeg')
      picture.source_url = "asdafemgrogmro-.dfaefgpen//afegepnp/jplaw-.txt"
      expect(picture).not_to be_valid
    end
  end
  describe "file extension" do
    let(:jpeg) { FactoryGirl.create(:picture_jpeg) }
    it "should support .jpeg" do
      expect(jpeg).to be_valid
    end
    let(:png) { FactoryGirl.create(:picture_png) }
    it "should support .png" do
      expect(png).to be_valid
    end
#    let(:webp) { FactoryGirl.create(:picture_webp) }
 #   it "should support .webp" do
  #    expect(webp).to be_valid
   # end
  end
end

