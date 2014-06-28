Rails.application.routes.draw do
  root :to => 'pages#index'
  resources :authors, :books
  get '/search' => 'pages#search'
end
