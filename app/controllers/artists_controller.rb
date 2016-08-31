class ArtistsController < ApplicationController
def index
  @artists = Artist.all
end

private
def build_artist
  @artist ||= Artist.new
  @artist.attributes = artist_params
end
def artist_params
  params[:artist]
  params[:artist] ? params[:artist] : {}
end
end
