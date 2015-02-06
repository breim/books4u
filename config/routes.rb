Rails.application.routes.draw do
  
  # Root path
  root 'pages#index'

  # Searchs path
  resources :searches do
    collection do
      get :autocomplete
    end
  end
  get '/search/:id' => 'searches#link'
  match '/search/' => 'searches#search', :as => :searchable,via: [:get]

  # Professors
  resources :professors, path: :professores
  # Recomendations inside professors_path
  get '/recomendar/:id' => 'professors#recommended', as: :recommended
  get '/nao-recomendar/:id' => 'professors#unrecommended', as: :unrecommended

  # Users
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # Admin system
  get '/admin' => "admin/admin#index",as: :admin 
  namespace :admin do
    resources :professors
    resources :users
  end

end