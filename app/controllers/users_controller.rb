class UsersController < ApplicationController

  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @top_tracks = spotify_user.top_tracks

  end
  # Returns average acousticness for user associated with instance
  private def get_average_acousticness
    average_acousticness = 0
    @top_tracks.each { |t| average_acousticness += t.audio_features.acousticness }
    average_acousticness /= @top_tracks.count
    average_acousticness # return
  end

  private def get_average_danceability
    average_danceability = 0
    @top_tracks.each { |t| average_danceability += t.audio_features.danceability}
    average_danceability /= @top_tracks.count
    average_danceability # return
  end

end
