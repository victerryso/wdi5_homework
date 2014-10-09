require 'pry'
require 'pry-debugger'
# binding.pry
# require_relative 'animal.rb'
# require_relative 'client.rb'
# require_relative 'shelter.rb'

# shelter = Shelter.new
# clients = Client.new
# animals = Animal.new

def greet
  puts "================================="
  puts "***** HAPPYTAILS Management *****"
  puts "================================="
  puts "(1) Display all animals"
  puts "(2) Display all clients"
  puts "(3) Create an animal"
  puts "(4) Create a client"
  puts "(5) Adopt an animal"
  puts "(6) Surrender an animal"
  puts "(q) Quit"
  puts = gets.chomp
end

def director
  response = greet
  if response == '1'
    puts "List of Animals"
    ################
  elsif response == '2'
    puts "List of Clients"
    ################
  elsif response == '3'
    puts "Create an Animal"
    create_an_animal
  elsif response == '4'
    puts "Create a Client"
    create_a_client
  elsif response == '5'
    puts "Adopt an Animal"
    # animal_adopter
  elsif response == '6'
    pus "Surrender an Animal"
    # surrender_animal
  elsif response == 'q'
    puts "Quitting"
    Kernel.exit
  end
end


def create_an_animal
  puts "Welcome to Create an Animal"
  puts "==========================="
  puts "What is the Animals name?"
  animal_name = gets.chomp
  puts "What is the Animals age?"
  animal_age = gets.chomp
  puts "What is the Animals gender?"
  animal_gender = gets.chomp
  puts "What is the Animals Species?"
  animal_species = gets.chomp
  puts "What toys does the Animal have?"
  animal_toy = gets.chomp

  animal = Animal.new(name, age, gender, species, toys)
    shelter << animal
    binding.pry
  end

def create_a_client
  puts "   Welcome to Create a Client   "
  puts "================================"
  puts "What is the Clients name?"
  client_name = gets.chomp
  puts "What is the Clients age?"
  client_age = gets.chomp
  puts "How many children does the Client have?"
  num_of_children = gets.chomp
  puts "How many pets does the Client have?"
  num_of_pets = gets.chomp

  client = Client.new(name, age, no_of_children, no_of_pets)
    shelter << client

  end

