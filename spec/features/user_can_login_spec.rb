require 'rails_helper'

RSpec.describe "user can login" do
  context "when providing correct info" do
    scenario "they are brought to their account home page" do
      user = User.create(username: "ryt11", email: "ryt11@gmail.com", password: "hunter2")

      visit login_path

      fill_in "session[username]", with: "ryt11"
      fill_in "session[password]", with: "hunter2"

      click_on "Log In"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("ryt11")
    end
  end
end
