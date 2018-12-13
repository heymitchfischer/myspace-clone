Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  get '/friend_requests' => 'friend_requests#index'
  post '/friend_requests' => 'friend_requests#create'
  delete '/friend_requests/:id' => 'friend_requests#destroy'
end
