require 'csv'
require 'pry'
require_relative 'client'

client_list = []
CSV.foreach("test.csv", {:headers => true, :header_converters => :symbol, }) do |row|
  client_list << temp = Client.new(row[:name],row[:num_of_children],row[:age],row[:array])
  binding.pry
end

p client_list
