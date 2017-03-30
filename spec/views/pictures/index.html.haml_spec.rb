require 'rails_helper'

RSpec.describe "pictures/index.html.haml", type: :view do
  describe "with many pictures" do
    it "should display many pictures" do
      @picture_jpeg = FactoryGirl.create :picture_jpeg
      @picture_png = FactoryGirl.create :picture_png
      @picture_webp = FactoryGirl.create :picture_webp
      @picture_gif = FactoryGirl.create :picture_gif

      render

      expect(page).to have_css('img', :count => 4)
    end
  end
end
