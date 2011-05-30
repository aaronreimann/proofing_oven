ProofingOven::Application.routes.draw do
  devise_for :users
  resources :candidates, except: :destroy
  match 'ui(/:action)', controller: 'ui'
  root to: 'ui#index'
end
