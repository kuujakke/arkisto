require 'rails_helper'
require 'capybara/dsl'
include Helpers

RSpec.feature "Picture upload", :type => :feature do
  background do
    create_moderator
    user_login("admin@example.com", "password")
    page.execute_script("$('.dropdown').addClass('open');")
    click_on "Moderator"
    click_on "Pictures"
  end
  feature "with valid picture file" do
    background do
      upload_test_jpeg
    end
    scenario "should be uploaded" do
      expect(page).to have_content "Picture was successfully created."
      expect(page).to have_content "test.jpeg"
    end
  end
  feature "with existing picture file" do
    scenario "should not be uploaded" do
      upload_test_jpeg
      first("#pictures").click_link("Pictures")
      upload_test_jpeg
      expect(page).not_to have_content "Picture was successfully created."
      expect(page).to have_content "File fingerprint is not unique!"
    end
  end
  feature "with similar picture file" do
    background do
      upload_test_jpeg
      first("#pictures").click_link("Pictures")
    end
    scenario "should not upload blurred file" do
      upload_blurred_test_jpeg
      expect(page).not_to have_content "Picture was successfully created."
      expect(page).to have_content "File fingerprint is not unique!"
    end
    scenario "should not upload horizontally flipped file" do
      upload_horizontally_flipped_file
      expect(page).not_to have_content "Picture was successfully created."
      expect(page).to have_content "File fingerprint is not unique!"
    end
    scenario "should not upload vertically flipped file" do
      upload_vertically_flipped_file
      expect(page).not_to have_content "Picture was successfully created."
      expect(page).to have_content "File fingerprint is not unique!"
    end
  end
end