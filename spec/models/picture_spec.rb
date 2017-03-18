require 'rails_helper'

RSpec.describe Picture, type: :model do
  describe "with valid parameters" do
    let(:image) { FactoryGirl.create(:image) }

    it "should be saved" do
      expect(image).to be_valid
    end
  end
  describe "with invalid parameters" do
    let(:image) { Picture.create file: "asd.jiipeegee", source_url: "teh-inter.nets" }

    it "should not be saved" do
      expect(image).not_to be_valid
    end
  end
  describe "file extension" do
    let(:jpeg) { FactoryGirl.create(:image_jpeg) }
    it "should support .jpeg" do
      expect(jpeg).to be_valid
    end
  end
end

