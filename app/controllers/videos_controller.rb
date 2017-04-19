class VideosController < ApplicationController

  before_action except:[:new, :create] { params[:peggo_redirect][:youtube_url] = youtube_sanitize(params[:peggo_redirect][:youtube_url]) }

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.new(audio: params[:video][:audio]) #strong params were failing here, could try to fix later

    if @video.save
      flash[:success] = "Depicted!"
      redirect_to user_path(current_user)
    else
      flash.now[:failure] = "Depiction failed, try again."
      render :new
    end
  end

  def youtube_redirect
    peggo_url = 'http://peggo.tv/dvr/' + youtube_params[:youtube_url]
    redirect_to(peggo_url)
  end


  #
  # private
  #
  #
  #  def video_params
  #   params.require(:video).permit(:audio)
  # end

  def youtube_params
    params.require(:peggo_redirect).permit(:youtube_url)
  end

  def youtube_sanitize(url)
    url.split('=')[1]
  end
end
