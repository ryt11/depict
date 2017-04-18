class AddAttachmentAudioToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :videos, :audio
  end
end
