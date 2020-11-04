require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "c361fcefeb8048f2bd901855ec16fa79", "800b57e7ffcb433c8421c98857fec580", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify user-top-read'
end
