require 'csv'
require 'pry'
require_relative 'client'
require_relative 'menupage'
require_relative 'arraytoobject'
require 'yaml'
c1 = Client.new("Walbert", 45, 3, [])
c2 = Client.new("Jeff Morrison", 50, 4, [])
clients = [c1,c2]
