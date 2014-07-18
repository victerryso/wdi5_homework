require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'


get '/' do
  redirect to '/map'
end

# all butterflies
get'/butterflies' do
  @butterflies = query_db "SELECT * FROM butterflies"

  erb :butterflies
end

# Forms for a new butterfly
get '/butterflies/new' do
  erb :new_butterfly
end

# Add a new butterfly to the database
post '/butterflies' do
  state= params[:state]
  family = params[:family]
  name = params[:name]
  image = params[:image]

  sql = "INSERT INTO butterflies (state, family, name, image) VALUES ('#{state}', '#{family}', '#{name}', '#{image}')"
  query_db sql
  redirect to '/butterflies'
end


# A specific butterfly
get'/butterflies/:id' do
  id = params[:id]
  sql = "SELECT * FROM butterflies WHERE id = #{ id }"
  @butterfly = query_db sql
  @butterfly = @butterfly.first # To get the single butterfly from the array or results.

  erb :butterfly
end


# Edit a butterfly
get'/butterflies/:id/edit' do
  id = params[:id]
  sql = "SELECT * FROM butterflies WHERE id = #{ id }"
  @butterfly = query_db sql
  @butterfly = @butterfly.first
  erb :edit_butterfly
end

# Update a butterfly
post '/butterflies/:id' do
  id = params[:id]
  state = params[:state]
  family = params[:family]
  name = params[:name]
  image = params[:image]

  sql = "UPDATE butterflies SET state= '#{ state }', family= '#{family}', name='#{name}', image= '#{image}' WHERE id= #{ id }"
  query_db sql
  redirect to "/butterflies/#{ id }"

end

# Delete a butterfly
get'/butterflies/:id/delete' do
    id = params[:id]
    sql = "DELETE FROM butterflies WHERE id=#{ id }"

    query_db sql
    redirect to "/butterflies"
end

get '/map' do
  # @state = params[:state]
  # @butterflies = query_db "SELECT * FROM butterflies"
  erb :map
end

get '/map/victoria' do
  id = params[:id]
  # @state = params[:state]
  sql = "SELECT * FROM butterflies WHERE state ='Victoria'"
  @butterflies = query_db sql

  erb :vic
end

get '/map/tasmania' do
  # @state = params[:state]
  sql = "SELECT * FROM butterflies WHERE state ='Tasmania'"
  @butterflies = query_db sql

  erb :tas
end


def query_db(sql)
  db = SQLite3::Database.new "butterflies.db"
  db.results_as_hash = true
  result = db.execute sql
  db.close
  result
end