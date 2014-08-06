Rails.application.routes.draw do
  get '/' => 'oceans#index', :as => 'index'
  get '/new' => 'oceans#new'
  post '/' => 'oceans#create'
  get '/:id' => 'oceans#edit', :as => 'edit'
  post '/:id' => 'oceans#update'
  get '/:id/delete' => 'oceans#destroy', :as => 'delete'
end
