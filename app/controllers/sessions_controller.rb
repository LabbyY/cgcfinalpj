class SessionsController < ApplicationController

  def new
    build_artist
    @artists = Artist.all
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      login_as user
      redirect_to artists_path
    else
      render :new
    end
  end

end
