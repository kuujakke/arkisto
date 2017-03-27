require 'rails_helper'
require 'capybara/dsl'
include Helpers

RSpec.feature "Moderator", :type => :feature do
  before :each do
    generate_users
  end
  feature "who is logged in with right credentials" do
    background do
      user_login "admin@example.com", "password"
      visit root_path
    end
    scenario "should have link to admin pages" do
      expect(page).to have_content("Moderator")
    end
    feature "should have dashboard that" do
      background do
        page.execute_script("$('.dropdown').addClass('open');")
        click_on "Moderator"
      end
      scenario "lists recent images" do
        expect(page).to have_content "Recent Pictures"
      end
      scenario "lists recent users" do
        expect(page).to have_content "Recent Users"
        expect(page).to have_content @user.email
        expect(page).to have_content @moderator.email
      end
    end
  end
  feature "should not" do
    background do
      user_login("user@example.com", "password")
      visit root_path
    end
    scenario "show link to users" do
      expect(page).not_to have_content("Moderator")
    end
    scenario "be available to users" do
      visit admin_root_path
      expect(page).to have_content "Unauthorized Access!"
    end
  end
end