require 'rails_helper'

RSpec.describe User, type: :model do
  describe "with valid" do
    describe "email and password" do
      let(:valid_user) { FactoryGirl.create(:user) }
      it "should be saved" do
        expect(valid_user).to be_valid
      end
    end
  end
  describe "with invalid" do
    describe "email and password" do
      let(:invalid_user) { User.new(email: "asd.com", password: "asd", password_confirmation: "asd") }
      it "should not be saved" do
        expect(invalid_user).not_to be_valid
      end
    end
    describe "email" do
      let(:user) { User.new(email: "asd/dfkfk.com", password: "Password1", password_confirmation: "Password1") }
      it "should not be saved" do
        expect(user).not_to be_valid
      end
    end
    describe "password" do
      let(:user) { User.new(email: "user@example.com", password: "asswo", password_confirmation: "asswo") }
      it "should not be saved" do
        expect(user).not_to be_valid
      end
    end
    describe "password confirmation" do
      let(:user) { User.new(email: "user@example.com", password: "Password1", password_confirmation: "Password2") }
      it "should not be saved" do
        expect(user).not_to be_valid
      end
    end
  end
end
