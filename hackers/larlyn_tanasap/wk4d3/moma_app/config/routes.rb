Rails.application.routes.draw do
  root :to => 'pages#index'
  resources :artists, :works# resources says give me the usual CRUD stuff for the artists
  # resources :works
end
