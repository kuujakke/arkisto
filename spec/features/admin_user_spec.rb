require 'rails_helper'
include Helpers

describe "Admin" do
  describe "who has signed up" do
    it "can login with right credentials" do
      login
    end
  end
end