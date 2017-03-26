module Helpers

  def login(credentials)
    visit login_path
    fill_in('Email', with: credentials[:email])
    fill_in('Password', with: credentials[:password])
    click_button('Log in')
  end

  def admin_login(credentials)
    visit new_admin_user_session_path
    fill_in('Email', with: credentials[:email])
    fill_in('Password', with: credentials[:password])
    click_button('Log in')
  end

end