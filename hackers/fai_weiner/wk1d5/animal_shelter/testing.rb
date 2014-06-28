require 'pry'
require 'pry-debugger'
require 'csv'

require_relative 'animal.rb'
require_relative 'client.rb'

#### SEED DATA ####

a1 = Animal.new("birdie", :bird, 2, :male, 3, :blue, :no, ["Parrot"], "Makes alot of noice in the morning")
a2 = Animal.new("jack", :dog, 5, :male, 6, :yellow, :yes, ["chew toys", "ropes"], "Loves bacon")
c1 = Client.new("WalbyBoy22", "Walbert", 45, 3, 2, ["sally", "alex"])
c2 = Client.new("faiball", "Fai", 20, 0, 0, [])

$clients = [c1, c2]
$animals = [a1, a2]

puts $clients[c1][:username]