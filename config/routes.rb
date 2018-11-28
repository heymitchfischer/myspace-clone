Rails.application.routes.draw do
  devise_for :users
  
  get '/' => 'static_pages#index'
  get '/home' => 'static_pages#index'
  devise_for :users
end
