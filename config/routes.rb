Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :gossips do
    resources :gossip_comments
  end
  resources :users
  resources :cities

  root 'gossips#index'
end
