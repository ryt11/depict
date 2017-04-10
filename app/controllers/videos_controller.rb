class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.new(video_params)
    if @video.save
      flash[:success] = "Depicted!"
      redirect_to user_path(current_user)
    else
      flash.now[:failure] = "Depiction failed, try again."
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:audio_file)
  end
end
 
