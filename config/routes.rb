Rails.application.routes.draw do
  get '/' => 'static_pages#index'
  get '/home' => 'static_pages#index'
  devise_for :users
  get '/index' => 'users#index'
  get '/users/:id' => 'users#show'
end
