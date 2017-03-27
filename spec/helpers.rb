require 'rails_helper'
module Helpers

  def user_login(email, password)
    visit new_user_session_path
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button('Log in')
  end

  def generate_users
    create_moderator
    create_user
  end

  def create_moderator
    @moderator = FactoryGirl.create(:moderator)
  end

  def create_user
    @user = FactoryGirl.create(:user)
  end

  def upload_picture(path)
    first("#pictures").click_link("Pictures")
    click_on 'New Picture'
    attach_file('File', File.absolute_path(path))
    click_on 'Create Picture'
  end

  def upload_test_jpeg
    upload_picture 'spec/pictures/test.jpeg'
  end

  def upload_blurred_test_jpeg
    upload_picture 'spec/pictures/blurred-test.jpeg'
  end

  def upload_horizontally_flipped_jpeg
    upload_picture 'spec/pictures/horizontally-flipped-test.jpeg'
  end

  def upload_vertically_flipped_jpeg
    upload_picture 'spec/pictures/vertically-flipped-test.jpeg'
  end

end