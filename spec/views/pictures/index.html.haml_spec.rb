require 'rails_helper'

RSpec.describe "pictures/index.html.haml", type: :view do
  describe "with many pictures" do
    before :each do
      assign(:picture_jpeg, FactoryGirl.create(:picture_jpeg))
      assign(:picture_png, FactoryGirl.create(:picture_png))
      assign(:picture_webp, FactoryGirl.create(:picture_webp))
      assign(:picture_gif, FactoryGirl.create(:picture_gif))
    end
    it "should display many pictures" do
      render
      expect(page).to have_css('img', :count => 4)
    end
  end
end
