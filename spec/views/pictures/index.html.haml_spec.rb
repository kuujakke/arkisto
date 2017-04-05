require 'rails_helper'

RSpec.describe "pictures/index.html.haml", type: :view do
  describe "with many pictures" do
    before :each do
      assign(:pictures, [
          FactoryGirl.create(:picture_jpeg),
          FactoryGirl.create(:picture_png),
          FactoryGirl.create(:picture_webp),
          FactoryGirl.create(:picture_gif)])
    end
    it "should display many pictures" do
      render
      expect(rendered).to have_css('img', :count => 4)
    end
  end
end
