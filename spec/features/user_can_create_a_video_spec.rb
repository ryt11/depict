require 'rails_helper'

RSpec.feature "A user can create a video" do
  context "when entering all info" do
    scenario "they are redirected to their profile to the video" do

      user = User.create(username: "ryt11", email: "ryt11@gmail.com", password: "hunter2")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_video_path

      fill_in 'video[audio_file]', with: "crystal_castles.mp4"

      click_on "Depict"

      expect(current_path).to eq(user_path(user))

      expect(page).to have_content("crystal_castles.mp4")


    end
  end
end
