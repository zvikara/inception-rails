Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '21531420672', '6856c8af8442619c2c516a07fe1301d2', {
  	:client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" },
  	:display => 'popup',
  	:scope => 'email, user_photos, friends_photos'
  }
end