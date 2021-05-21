Rails.application.routes.draw do
  get 'search/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    } 


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    resources :tweets do 
      post :follower
      resources :likes
      member do
        post 'retweet'
      end
    end
    devise_scope :user do
      post 'follow/:id', to: 'friends#follow', as: 'follow_user'
      delete 'follow/:id', to: 'friends#unfollow', as: 'unfollow_user'
    end

    get '/tweets/retweet/:id', to: 'tweets#retweet', as: 'retweet'
    
  resources :users do
    resources :friends
  end

  namespace :api, defaults: {format: 'json'} do
    resources :tweets, only: [:index, :create, :destroy, :update, :show]
  end


  get '/api/news', to: 'api/apis#index'
  get "/api/:fecha1/:fecha2", to: 'api/apis#dates'
  post '/api/create', to: 'api/apis#create'


  root "tweets#index"
  get 'search', to: 'search#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
