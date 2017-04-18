require 'rails_helper'

RSpec.feature "When user clicks on a video link" do
  context "they are taken to a show page" do
    scenario "that has video info" do
      user = User.create(username: "ryt11", email: "ryt11@gmail.com", password: "hunter2")
      video = user.videos.create(audio_file: "crystal_castles.mp4", video_file: "generated_music_video")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_on "crystal_castles.mp4"

      expect(current_path).to eq(video_path(video))
      expect(page).to have_content("crystal_castles.mp4")

    end
  end
end
