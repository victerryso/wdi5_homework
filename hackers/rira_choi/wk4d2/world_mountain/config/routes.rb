Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/mountains' => 'pages#index'
  get '/mountains/new' => 'pages#new'
  post '/mountains' => 'pages#create'

  get '/mountains/:id' => 'pages#show', :as => 'mountain'
  post '/mountains/:id/delete' => 'pages#destory', :as => 'mountain_delete'
  get '/mountains/:id/edit' => 'pages#edit', :as => 'mountain_edit'
  post '/mountains/:id' => 'pages#update'

end
