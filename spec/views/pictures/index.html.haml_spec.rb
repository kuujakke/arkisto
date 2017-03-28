require 'rails_helper'

RSpec.describe "pictures/index.html.haml", type: :view do
  describe "with many pictures" do
    before :each do
      FactoryGirl.create :picture_jpeg
      FactoryGirl.create :picture_png
      FactoryGirl.create :picture_webp
      FactoryGirl.create :picture_gif
    end
    #it "should display many pictures" do
    #  visit pictures_path
    #  expect(page).to have_css('img', :count => 4)
    #end
  end
end
