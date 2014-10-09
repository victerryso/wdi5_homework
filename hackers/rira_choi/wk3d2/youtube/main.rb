require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'


get '/' do
  redirect to '/videos'
end

# all butterflies
get'/videos' do
  @videos = query_db "SELECT * FROM videos"
  erb :videos
end

# Forms for a new butterfly
get '/videos/new' do
  erb :new_video
end

# Add a new butterfly to the database
post '/videos' do
  title = params[:title]
  description = params[:description]
  url = params[:url]
  genre = params[:genre]
  sql = "INSERT INTO videos (title, description, url, genre) VALUES ('#{title}', '#{description}', '#{ url }', '#{ genre }')"
  query_db sql
  redirect to '/videos'
end


# A specific butterfly
get'/videos/:id' do
  id = params[:id]
  sql = "SELECT * FROM videos WHERE id = #{ id }"
  @video = query_db sql
  @video = @video.first # To get the single butterfly from the array or results.

  erb :video
end


# Edit a butterfly
get'/videos/:id/edit' do
  id = params[:id]
  sql = "SELECT * FROM videos WHERE id = #{ id }"
  @video = query_db sql
  @video = @video.first
  erb :edit_videos
end

# Update a butterfly
post '/videos/:id' do
  id = params[:id]
  title = params[:title]
  description = params[:description]
  url = params[:url]
  genre = params[:genre]

  sql = "UPDATE videos SET title='#{title}', description= '#{description}', url= '#{ url }', genre = '#{ genre }' WHERE id= #{ id }"
  query_db sql
  redirect to "/videos/#{ id }"

end

# Delete a butterfly
get'/videos/:id/delete' do
    id = params[:id]
    sql = "DELETE FROM videos WHERE id=#{ id }"

    query_db sql
    redirect to "/videos"
end


def query_db(sql)
  db = SQLite3::Database.new "videos.db"
  db.results_as_hash = true
  result = db.execute sql
  db.close
  result
end