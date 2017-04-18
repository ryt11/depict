class RemoveAudioFileFromVideos < ActiveRecord::Migration[5.0]
  def change
    remove_column :videos, :audio_file
  end
end
