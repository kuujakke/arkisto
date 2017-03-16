require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "with valid parameters" do
    let(:image) { Image.create file: "191231239.jpg", source: "https://www.asd.com/foo/bar" }

    it "should be saved" do
      expect(image).to be_valid
    end

    it "should have supported filetype" do
    end
  end
  describe "with invalid parameters" do
    let(:image) { Image.create file: "asd.jiipeegee", source: "teh-inter.nets" }

    it "should not be saved" do
      expect(image).not_to be_valid
    end
  end
end
