require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "with valid parameters" do
    let(:image) { FactoryGirl.create(:image) }

    it "should be saved" do
      expect(image).to be_valid
    end
  end
  describe "with invalid parameters" do
    let(:image) { Image.create file: "asd.jiipeegee", source_url: "teh-inter.nets" }

    it "should not be saved" do
      expect(image).not_to be_valid
    end
  end
  describe "file extension" do
    let(:jpeg) { FactoryGirl.create(:image_jpeg) }
    it "should support .jpeg" do
      expect(jpeg).to be_valid
    end
    let(:png) { FactoryGirl.create(:image_png) }
    it "should support .png" do
      expect(png).to be_valid
    end
    let(:webp) { FactoryGirl.create(:image_webp) }
    it "should support .webp" do
      expect(webp).to be_valid
    end
  end
end

