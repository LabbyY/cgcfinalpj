class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logined?

  def logined?
  !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login_as(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def build_artist
    @artist ||= Artist.new
    @artist.attributes = artist_params
  end

  def artist_params
    artist_params = params[:artist]
    artist_params ? artist_params.permit(:artistname, :country, :genre, :introduction, :avatar) : {}
  end

end
