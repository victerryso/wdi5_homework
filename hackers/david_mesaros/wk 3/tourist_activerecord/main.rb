require 'sinatra'
require 'sinatra/reloader'
# require 'pry'
# require 'pry-debugger'
require 'sqlite3'

require_relative 'places'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  redirect to '/tourist'
end

get '/tourist' do
  @places = Place.all
  erb :tourist
end


# fill in the details of new ninja
get '/tourist/new' do
  erb :new_place
end

# save the details of the ninja and it hidden ready to be used when called
get '/tourist/id' do
  id = params[:id]
  @place = Place.find id

  erb :place
end

# edit the Ninja function to call it
get '/tourist/:id/edit' do
  id = params[:id]
  @place = Place.find id
  erb :edit
end

post '/tourist/:id' do
   id = params[:id]
  place = Place.find params[:id]
  place.title = params[:title]
  place.description= params[:description]
  place.address = params[:address]

  place.save

redirect "/tourist/#{ place.id }"

erb :tourst

end

get '/tourist/:id/delete' do
  id = params[:id]
  place = Place.find id
  place.destroy

  redirect to "/tourist"

end



# update the new ninja
post '/tourist' do
  
  Place.create :title => params[:title], :description => params[:description], :address => params[:address]
  
  redirect to '/tourist'
end



def query_db(sql)
  db =SQLite3::Database.new "places.db"
  db.results_as_hash = true
  result = db.execute sql
  db.close
  result
end