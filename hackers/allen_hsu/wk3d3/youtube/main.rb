require 'sinatra'
require 'pry'
require 'sinatra/reloader'
require 'sqlite3'
require 'httparty'
require 'JSON'
require 'oauth'
require 'google/api_client'
require 'trollop'
require 'rubygems'

DEVELOPER_KEY = "AIzaSyBgaypWR24rLTQ8NqdglcJBL5zIUFUgAVc"
YOUTUBE_API_SERVICE_NAME = "youtube"
YOUTUBE_API_VERSION = "v3"

def search_youtube(search_term)
  opts = Trollop::options do
    opt :q, 'Search term', :type => String, :default => 'Google'
    opt :maxResults, 'Max results', :type => :int, :default => 25
  end

  client = Google::APIClient.new(:key => DEVELOPER_KEY,
                                 :authorization => nil)
  youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

  # Call the search.list method to retrieve results matching the specified
  # query term.
  opts[:part] = 'id,snippet'
  opts[:q] = search_term
  search_response = client.execute!(
    :api_method => youtube.search.list,
    :parameters => opts
  )
  videos = []
  search_response.data.items.each do |search_result|
    case search_result.id.kind
    when 'youtube#video'
      videos << {
      "title" => "#{search_result.snippet.title}",
      "url" =>"#{search_result.id.videoId}",
      "thumbnail" => "#{search_result.snippet["thumbnails"]["default"]["url"]}"
      }
    end
  end
  videos
end

def query_db(sql)
  db = SQLite3::Database.new('youtube.db')
  db.results_as_hash = true
  result = db.execute(sql)
  db.close
  result
end

get '/' do
  redirect to '/videos'
end

#a specific video
get '/videos/:id/edit' do
  id = params["id"]
  @info = query_db("SELECT * FROM videos WHERE id = #{ id }").first
  erb :edit
end
#delete video
get '/videos/:id/delete' do
  id = params["id"].to_i
  sql = "DELETE FROM videos WHERE id = #{id}"
  query_db(sql)
  redirect to '/videos'
end

#all videos
get '/videos' do
  @videos = query_db("SELECT * FROM videos")
  erb :videos
end
#new video
get '/videos/new' do
  @title = ""
  @url = ""
  if params["title"]
    @title = params["title"].gsub("'","")
    @url = "http://www.youtube.com/embed/" + params["url"]
  end
  erb :create
end
#post new
post '/videos' do
  title = params["title"]
  description = params["description"]
  url = ""
  if params["url"].include?("www")
    url = "http://www.youtube.com/embed/" + params["url"].match(/(?<=v\=).*/).to_s
  else
    url = params["url"]
  end
  genre = params["genre"]
  desciption = params["description"]
  sql = "INSERT INTO videos (title, description, url, genre) values ('#{title}', '#{description}', '#{url}','#{genre}')"
  query_db(sql)
  redirect to '/videos'
end
#search function
get '/videos/search' do
  search_term = params["search_term"]
  @results = search_youtube(search_term)
  erb :search
end
#genre filter
get '/videos/genre' do
  genre = params["genre"]
  sql = "SELECT * FROM videos WHERE genre = '#{genre}'"
  @videos = query_db(sql)
  erb :videos
end

#edit a video
get '/videos/:id' do
  id = params["id"]
  @info = query_db("SELECT * FROM videos WHERE id = #{ id }").first
  erb :edit
end

#post edit
post '/videos/:id' do
  id = params['id']
  genre = params["genre"]
  description = params["description"]
  title = params["title"]
  sql = "UPDATE videos SET genre = '#{genre}', description = '#{description}', title = '#{title}' WHERE id = #{id}"
  query_db(sql)
  redirect to "/videos"
end



