class ArtistsController < ApplicationController

  def index
    build_artist
    @artists = Artist.all
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def show
    load_artist
  end

  def create
    build_artist

    respond_to do |format|
      if @artist.save
        format.html { redirect_to artists_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    load_artist
  end

  def update
    load_artist

    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to artists_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    load_artist
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_path }
    end
  end

# def artistinfo(artist)
#   build_artist
#   respond_to do |format|
#   @artist ||= artist
# end
# end


private

  def load_artist
    @artist ||= Artist.find_by(params[:artist_id])
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
