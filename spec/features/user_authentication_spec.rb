require 'rails_helper'

RSpec.describe "User Authentication", type: :feature do
  context "when a user is not registered" do
    it "allows a user to sign up" do
      visit new_user_registration_path
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "password123"
      fill_in "Password confirmation", with: "password123"
      click_button "Sign up"
      expect(page).to have_text("Welcome! You have signed up successfully.")
    end

    it "does not allow a user to sign up without an email" do
      visit new_user_registration_path
      fill_in "Password", with: "password123"
      fill_in "Password confirmation", with: "password123"
      click_button "Sign up"
      expect(page).to have_text("Email can't be blank")
    end

    it "does not allow a user to sign up without a password" do
      visit new_user_registration_path
      fill_in "Email", with: "test@example.com"
      click_button "Sign up"
      expect(page).to have_text("Password can't be blank")
    end
  end

  context "when a user is already signed up" do
    before do
      User.create(email: "test@example.com", password: "password123")
    end
    it "does not allow a user to sign up with a duplicate email" do
      visit new_user_registration_path
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "password123"
      fill_in "Password confirmation", with: "password123"
      click_button "Sign up"
      expect(page).to have_text("Email has already been taken")
    end
  end

  context "when a user is not logged in" do
    before do
      User.create(email: "test@example.com", password: "password123")
    end

    it "allows a user to log in" do
      visit new_user_session_path
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "password123"
      click_button "Log in"
      expect(page).to have_text("Signed in successfully.")
    end

    it "does not allow a user to log in with an incorrect password" do
      visit new_user_session_path
      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      expect(page).to have_text("Invalid Email or password.")
    end

    it "does not allow a user to log in with an incorrect email" do
      visit new_user_session_path
      fill_in "Email", with: "wrong_email@example.com"
      fill_in "Password", with: "password123"
      click_button "Log in"
      expect(page).to have_text("Invalid Email or password.")
    end
  end
end
