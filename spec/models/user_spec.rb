require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = User.create(email: "toto@toto.toto", password: "123456", password_confirmation: "123456")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#email" do
      it "should not be valid without email" do
        bad_user = User.create(password: "123456")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:email)).to eq(true)
      end
    end

    describe "#password" do
      it "should not be valid without password" do
        bad_user = User.create(email: "toto@toto.toto")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:password)).to eq(true) 
      end
    end

  end
end