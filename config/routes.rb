ProofingOven::Application.routes.draw do
  devise_for :users
  match 'ui(/:action)', controller: 'ui'
  root to: 'ui#index'
end
