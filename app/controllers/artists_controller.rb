class ArtistsController < ApplicationController
def index
  build_artist
  @artists = Artist.all
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


private
def build_artist
  @artist ||= Artist.new
  @artist.attributes = artist_params
end
def artist_params
  artist_params = params[:artist]
  artist_params ? artist_params.permit(:artistname, :country, :genre, :introduction) : {}
end

end
