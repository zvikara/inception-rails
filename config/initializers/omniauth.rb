Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], { 
  	:display => 'popup',
  	:scope => 'email, user_photos, friends_photos'
  }
end