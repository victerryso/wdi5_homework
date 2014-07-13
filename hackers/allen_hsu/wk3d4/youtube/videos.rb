require 'active_record'
require 'pry'
#setup
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'youtube.db'
  )

class Videos < ActiveRecord::Base
end
