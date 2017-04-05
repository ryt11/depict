require 'rails_helper'

RSpec.feature "User can create an account" do
  context "when providing all info" do
    scenario "they are logged in and redirected to their home page" do
      visit new_user_path

      fill_in "user[username]", with: "Ryt11"
      fill_in "user[email]", with: "ryt11@gmail.com"
      fill_in "user[password]", with: "hunter2"
      fill_in "user[password_confirmation]", with: "hunter2"

      click_on "Create Account"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Account creation successful! Welcome, Ryt11")
     end
  end
end
