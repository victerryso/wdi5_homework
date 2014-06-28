require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pry-debugger'
require 'sqlite3'

require_relative 'ninjas'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  redirect to '/ninjas'
end

get '/ninjas' do
  @ninjas = Ninja.all
  erb :ninjas
end


# fill in the details of new ninja
get '/ninjas/new' do
  erb :new_ninja
end

# save the details of the ninja and it hidden ready to be used when called
get '/ninjas/id' do
  id = params[:id]
  @ninja = Ninja.find id

  erb :ninja
end

# edit the Ninja function to call it
get '/ninja/:id/edit' do
  id = params[:id]
  @ninja = Ninja.find id
  erb :edit
end

post '/ninjas/:id' do
  id = params[:id]
  ninja = Ninja.find id
  ninja.title = params[:title]
  ninja.description= params[:description]
  ninja.address = params[:address]

  ninja.save

redirect "/ninjas/#{ ninja.id }"
erb :ninjas
end

get '/ninjas/:id/delete' do
  id = params[:id]
  ninja = Ninja.find id
  ninja.destroy

  redirect to "/ninjas"

end



# update the new ninja
post '/ninjas' do
  
  Ninja.create :title => params[:title], :description => params[:description], :address =>[:address]
  
  redirect to '/ninjas'
end


