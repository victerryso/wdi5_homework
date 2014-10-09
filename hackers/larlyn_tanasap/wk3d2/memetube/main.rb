require 'sqlite3'
require 'sinatra'
require 'sinatra/reloader'

before do
    @genres = query_db("SELECT DISTINCT genre FROM videos")
end

get '/' do
  redirect("/videos")
end

get '/videos' do
  @videos = query_db("SELECT * FROM videos")
  erb :videos
end

post '/videos' do
  title = params[:title]
  description = params[:description]
  url = params[:url]
  genre = params[:genre]
  sql = "INSERT INTO videos (title, description, url, genre) VALUES ('#{ title }','#{ description }','#{ url }','#{ genre }')"
  query_db(sql)
  redirect("/videos")
end

get '/videos/genres/:genre' do
  genre_to_get = params[:genre]
  sql = "SELECT * FROM videos WHERE genre = '#{ genre_to_get }'"
  @videos = query_db(sql)
  erb :video_by_genre
end

get '/videos/:id' do
  single_match(params[:id])
  erb :video
end

get '/videos/:id/edit' do
  single_match(params[:id])
  erb :edit_video
end

post '/videos/:id' do
  title = params[:title]
  description = params[:description]
  url = params[:url]
  genre = params[:genre]
  sql = "UPDATE videos SET name = '#{ title }', description = '#{ description }', url = '#{ url }', genre = '#{ genre }' WHERE id = #{ id }"
  query_db(sql)
  redirect("/videos/#{ id }")
end

get '/videos/:id/delete' do
  id = params[:id]
  sql = "DELETE FROM videos WHERE id = #{ id }"
  query_db(sql)
  redirect("/videos")
end

def single_match(id)
  sql = "SELECT * FROM videos WHERE id = #{ id }"
  @video = query_db(sql).first
end

def query_db(sql)
  db = SQLite3::Database.new "videos.db"
  db.results_as_hash = true
  result = db.execute sql
  db.close
  result
end