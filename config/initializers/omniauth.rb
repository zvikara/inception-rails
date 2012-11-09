Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], { 
  	:display => 'popup',
  	:scope => 'email, read_stream, publish_stream, read_friendlists, friends_likes, friends_status, offline_access, user_photos, friends_photos'
  }
end