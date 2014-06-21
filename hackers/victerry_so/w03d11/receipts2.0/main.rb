require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do # main page
  @receipts = query_db "SELECT * FROM receipts" # assigning the sql command to select all receipts into the variable
  erb :receipts # erb file lists each receipt folloed with their link
end

get '/new' do # new page
  erb :new_receipt # erb file gets inputs via forms then goes to the page below
end

post '/' do
      # "INSERT INTO receipts (service, cost) VALUES ('Do some service', '12')"
  sql = "INSERT INTO receipts (service, cost) VALUES ('#{ params['service'] }', '#{ params['cost'] }')"
  query_db sql
  redirect to "/"
end

get "/receipts/:id" do
  id = params[:id] # getting parameters
  sql = "SELECT * FROM receipts WHERE id = #{id}" # viewing file with corresponding id
  @receipt = query_db sql # variable contains info from data
  @receipt = @receipt.first # "Flatten"
  erb :receipt
end

post "/receipts/:id" do
  id = params[:id]
  sql = "UPDATE receipts SET service = '#{params['service']}', cost = '#{params['cost']}' WHERE id = #{id}"
  query_db sql
  redirect to "/receipts/#{id}"
end

get "/receipts/:id/edit" do
  @id = params[:id]
  sql = "SELECT * FROM receipts WHERE id = #{@id}" # viewing file with corresponding id
  @receipt = query_db sql # variable contains info from data
  @receipt = @receipt.first # "Flatten"
  erb :edit_receipt
end

get "/receipts/:id/delete" do
  id = params[:id]
  sql = "DELETE FROM receipts WHERE id = #{id}"
  query_db sql
  redirect to "/"
end

get "/stats" do
  @max = query_db("SELECT MAX(cost) FROM receipts").last[0]
  @min = query_db("SELECT MIN(cost) FROM receipts").last[0]
  @avg = query_db("SELECT AVG(cost) FROM receipts").last[0]
  @count = query_db("SELECT COUNT(*) FROM receipts").last[0]

  erb :stats
end



def query_db(sql)
  db = SQLite3::Database.new "receipts.db" # getting database from the file
  db.results_as_hash = true # changing array of arrays to array of hashes
  result = db.execute sql # saving the sql command of the database into result
  db.close # closing database
  result #returning the result
end