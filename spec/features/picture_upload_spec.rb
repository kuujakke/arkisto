require 'rails_helper'
include Helpers

describe "Picture" do
  admin_login(email: "admin@example.com", password: "password")
  save_and_open_page
end