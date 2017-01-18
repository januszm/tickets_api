Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  resources :issues
  resources :users

end
