ProofingOven::Application.routes.draw do
  devise_for :users
  resources :candidates, only: :index
  match 'ui(/:action)', controller: 'ui'
  root to: 'ui#index'
end
