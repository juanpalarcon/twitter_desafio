Rails.application.routes.draw do
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
  namespace :api do
    resources :tweets
  end

  root "tweets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
