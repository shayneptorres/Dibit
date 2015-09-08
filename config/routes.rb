Rails.application.routes.draw do

  root 'pages#home'

  get "/home", to: 'pages#home'
  #get '/dibs', to: 'dibs#index'
  #get '/dibs/new', to: 'dibs#new', as: 'new_dib'
  #post '/dibs', to: 'dibs#create'
  #get '/dibs/:id/edit', to: 'dibs#edit', as: 'edit_dib'
  #patch '/dibs/:id', to: 'dibs#update'
  #get 'dibs/:id', to: 'dibs#show', as: 'dib'
  #delete '/dibs/:id', to: 'dibs#destroy'

  resources :dibs

  resources :dibbers, except: [:new]

  get '/register', to: "dibbers#new"

end
