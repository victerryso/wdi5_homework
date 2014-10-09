require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

require_relative 'youtube'

before do 
  sql = "SELECT genre FROM genres"
  @genre_list = query_db(sql)
  @genre_list.each do |genre|
    @genre_sorted ||= [] 
    @genre_sorted << genre.values.first
    @genre_sorted.sort!
  end
end

after do
  ActiveRecord::Base.connection.close
end

get '/' do #redirect to landing
  redirect to "/youtube"
end

get '/youtube' do #list of all videos
  @all_youtubes = Youtube.all
  erb :all_youtubes
end

get '/youtube/new' do #link that takes you to add new videos
  erb :new_youtube
end

get '/youtube/:id' do #display a specific video
  id = params[:id]
  @youtube = Youtube.find id
  erb :view
end

post '/youtube/:id' do #update a specific video
  youtube = Youtube.find params[:id]
  youtube.title = params[:title]
  youtube.description = params[:description]
  youtube.genre = params[:genre]

  youtube.save

  redirect to "/youtube/#{ params[:id] }"
end

post '/youtube' do #posting a new video into the database
  youtube = Youtube.new
  youtube.title = params[:title]
  youtube.description = params[:description]
  youtube.url = params[:url]
  youtube.genre = params[:genre]

  youtube.save
  redirect to "/youtube"
end


get '/youtube/:id/edit' do
  id = params[:id]
  @youtube = Youtube.find id
  erb :edit_youtube
end

get '/youtube/:id/delete' do
  id = params[:id]
  youtube = Youtube.find id
  youtube.destroy
  redirect to '/youtube'
end

def query_db(sql)
  db = SQLite3::Database.new "youtube.db"
  db.results_as_hash = true
  result = db.execute sql
  db.close
  result
end

