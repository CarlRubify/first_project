Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments
  end
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  root 'articles#index'
end
