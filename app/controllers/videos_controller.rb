class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    
  end

  private

  def video_params
    params.require(:video).permit(:audio_file)
  end
end
