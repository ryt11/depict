class Video < ApplicationRecord
  belongs_to :user
  has_attached_file :audio
  before_save :extract_metadata
  serialize :metadata


  def audio?
    upload_content_type =~ %r{^audio/(?:mp3|mpeg|mpeg3|mpg|x-mp3|x-mpeg|x-mpeg3|x-mpegaudio|x-mpg)$}
  end


  def display_name
  @display_name ||= if audio? && metadata?
    artist, title = metadata.values_at('artist', 'title')
    title.present? ? [title, artist].compact.join(' - ').force_encoding('UTF-8') : upload_file_name
    else
      upload_file_name
    end
  end

  private

# Retrieves metadata for MP3s
  def extract_metadata
    return unless audio?
    path = upload.queued_for_write[:original].path
    open_opts = { :encoding => 'utf-8' }
    Mp3Info.open(path, open_opts) do |mp3info|
      self.metadata = mp3info.tag
    end
  end
end
