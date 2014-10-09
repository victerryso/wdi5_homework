Rails.application.routes.draw do
  get '/oceans' => 'oceans#index' #show all oceans on index page
  get '/oceans/new' => 'oceans#new' #add new ocean
  post '/oceans' => 'oceans#create' #post new ocean created
  get '/oceans/:id' => 'oceans#show', :as => 'ocean' #show a single planet
  post '/oceans/:id/delete' => 'oceans#destroy', :as => 'ocean_delete' #delete planet
  get '/oceans/:id/edit' => 'oceans#edit', :as => 'ocean_edit'
  post '/oceans/:id' => 'oceans#update'
end
