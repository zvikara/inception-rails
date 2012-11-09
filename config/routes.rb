InceptionRails::Application.routes.draw do
  #get "authentication/create"

  authenticated :user do
    root :to => 'home#photos'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  match '/auth/:provider/callback' => 'authentication#create'
end