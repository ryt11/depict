class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:failure] = "Login Failed"
      render :new
    end
  end
end
