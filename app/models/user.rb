require 'RSpotify'

class User < ApplicationRecord
  @spotify_user


  def initialize(spotify_user)
    raise TypeError unless spotify_user.is_a? RSpotify::User
    @spotify_user = spotify_user
  end

  private def get_top_tracks
    top_tracks = @spotify_user.top_tracks
  end

  private def get_top_artists
    top_artists = @spotify_user.top_artists
  end

  private def get_track_seeds
    track_seeds = []
    i = 0
    until i > 4
      track_seeds[i] = get_top_tracks[i]
      i += 1
    end
  end

  def get_playlist
    recommendation = RSpotify::Recommendations.generate(seed_tracks: get_track_seeds.map(&:id))
    recommendation.tracks
  end

end
