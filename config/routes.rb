Rails.application.routes.draw do
  resources :chats
  devise_for :users
  root to: 'pages#index'
end
