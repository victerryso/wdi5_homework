require 'pry'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'w'))

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => 'youtube.db'
  )

class Youtube < ActiveRecord::Base
end
