# Pages Controller
#
class PagesController < ApplicationController
  def index
    artists = RSpotify::Artist.search('Bobby Shmurda')
    @artist_name = artists.first.name
  end
end
