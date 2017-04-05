require 'rails_helper'

RSpec.feature "A user can create a video" do
  context "when entering all info" do
    scenario "they are redirected to their profile to the video" do
      visit new_video_path

      fill_in 'video[audio_file]', with: "crystal_castles.mp4"

      click_on "Depict"

      expect(current_path).to eq(user_path(current_user))

      expect(page).to have_content("crystal_castles.mp4")


    end
  end
end
