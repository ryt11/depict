class Video < ApplicationRecord
  belongs_to :user
  has_attached_file :audio
  validates_attachment_content_type :audio,
                                   :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
  # before_save :extract_metadata
  # serialize :metadata


  def audio?
    audio_content_type =~ %r{^audio/(?:mp3|mpeg|mpeg3|mpg|x-mp3|x-mpeg|x-mpeg3|x-mpegaudio|x-mpg)$}
  end


  def display_name
  @display_name ||= if audio? && metadata?
    artist, title = metadata.values_at('artist', 'title')
    title.present? ? [title, artist].compact.join(' - ').force_encoding('UTF-8') : audio_file_name
    else
      audio_file_name
    end
  end

  private

# Retrieves metadata for MP3s
  # def extract_metadata
  #   return unless audio?
  #   path = audio.queued_for_write[:original].path
  #   open_opts = { :encoding => 'utf-8' }
  #   Mp3Info.open(path, open_opts) do |mp3info|
  #     self.metadata = mp3info.tag
  #   end
  # end
end
