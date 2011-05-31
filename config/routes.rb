ProofingOven::Application.routes.draw do
  devise_for :users
  resources :candidates, except: :destroy do
    collection do
      post :filter
    end
  end
  match 'ui(/:action)', controller: 'ui'
  root to: 'ui#index'
end
