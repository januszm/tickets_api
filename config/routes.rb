Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  resources :issues do
    collection do
      post 'assign'
      post 'finalize'
    end
  end
  resources :users

end
