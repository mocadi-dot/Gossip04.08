Rails.application.routes.draw do

  # Landing page get 'welcome/:user_name', to: 'welcome#show', as: 'welcome'
     get '/index', to:'welcome#show'
     root to: 'gossips#index'
    # pages statiques
    get '/team', to: 'statics#team'
    get '/contact', to: 'statics#contact'


    get '/gossip/:id', to: 'gossips#show', as: 'show'

    get '/user/:id', to: 'users#show', as: 'user'

    # get 'gossips/new' ... plus tard...
    resources :profile
    resources :gossips

    resources :gossips do
      resources :comments
      resources :likes, only: %i[create destroy]
    end
    resources :users
    resources :cities, only: %i[show index]
    resources :sessions, only: %i[new create destroy]





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
