require 'rails_helper'

RSpec.describe Similarity, type: :model do
  describe "with valid parameters" do
    before :all do
      @picture = FactoryGirl.create(:picture_jpeg)
      @similar = FactoryGirl.create(:picture_png)
      @similarity = Similarity.create(picture: @picture, similar: @similar, levenshtein: 3, hamming: 0.4)
    end
    it "should be saved" do
      expect(@similarity).to be_valid
      expect(Similarity.count).to eq 1
    end
    it "should not be duplicated" do
      another = Similarity.new(picture: @picture, similar: @similar, levenshtein: 3, hamming: 0.4)
      expect(another).not_to be_valid
      expect(Similarity.count).to eq 1
    end
  end
end
