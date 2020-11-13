class UsersController < ApplicationController

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    recommendations = RSpotify::Recommendations.generate(seed_tracks: get_top_tracks.map(&:id))
    @tracks = recommendations.tracks

    playlist = @spotify_user.create_playlist!('SongsUnheard')
    playlist.add_tracks!(@tracks)
  end

  private def get_top_tracks
   top_tracks = @spotify_user.top_tracks(limit: 5)
  end
end
