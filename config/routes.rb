Rails.application.routes.draw do
  
  resources :contents
  devise_for :users

  root 'pages#home'

  get 'about' => 'pages#about'

  post '/compra/:slug', to: 'transactions#create', as: :compra
  get '/pickup/:guid', to: 'transactions#pickup', as: :pickup

  get 'dashboard' => 'pages#dashboard'
end
