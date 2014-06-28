require 'pry'
require 'pry-debugger'
require_relative 'animal'
require_relative 'client'
require_relative 'shelter'

# Storage arrays

all_animals = []
all_clients = []

# Shelter.client

# Seed Data
happi_tails = Shelter.new('Happi Tails')

all_animals << Animal.new('peter', 3, 'male', 'rabbit', 'none')
all_animals << Animal.new('sam', 13, 'male', 'dog', 'chewy')
all_animals << Animal.new('lilly', 2, 'female', 'cat', 'ball')
all_animals << Animal.new('rex', 8, 'male', 'mouse', 'mini football')

all_clients << Client.new('greg', 2, 'male', 0)
all_clients << Client.new('bill', 1, 'male', 1)
all_clients << Client.new('george', 0, 'female', 0)
all_clients << Client.new('nick', 3, 'male', 3)


run = 'y'
while run == 'y'
# MENU

# def start_menu
  puts
  puts "Please select from the follow options:"
  puts "*** ADD ***"
  puts "(1) Add an animal."
  puts "(2) Add a client."
  puts
  puts "*** VIEW ***"
  puts "(3) View all animals."
  puts "(4) View all clients."
  puts
  puts "*** SEARCH ***"
  puts "(5) Search animals."
  puts "(6) Search clients"
  puts
  puts "(7) Quit"

  menu_choice = gets.chomp.to_i

  if menu_choice == 1
    puts
    print "New animal name: "
    new_animal_name = gets.chomp
    print "Age: "
    new_animal_age = gets.chomp.to_i
    print "Gender: "
    new_animal_gender = gets.chomp
    print "Species: "
    new_animal_species = gets.chomp
    print "Toy: "
    new_animal_toy = gets.chomp

    new_animal_object = Animal.new(new_animal_name, new_animal_age, new_animal_gender, new_animal_species, new_animal_toy)
    all_animals << new_animal_object
    puts
    puts "Saved: #{new_animal_object}"
    puts

  elsif menu_choice == 2
    puts
    print "New client name: "
    new_client_name = gets.chomp
    print "No. Children: "
    new_client_children = gets.chomp
    print "Age: "
    new_client_age = gets.chomp.to_i
    print "No. Pets: "
    new_client_pets = gets.chomp

    new_client_object = Client.new(new_client_name, new_client_children, new_client_age, new_client_pets,)
    all_clients << new_client_object
    puts
    puts "Saved: #{new_client_object}"
    puts

  elsif menu_choice == 3
    puts
    puts "Below are all the animals at #{happi_tails}:"

    all_animals.each do |a|
    puts "#{a.to_s}\n"
    end

  elsif menu_choice == 4
    puts
    puts "Below are all of the clients at #{happi_tails}:"

    all_clients.each do |c|
    puts "#{c.to_s}\n"
    end

  elsif menu_choice == 5
    puts
    print "Search by animal name: "
    search_string = gets.chomp.downcase

    result = all_animals.find_all do |a|
    a.name == search_string
    end
    puts "#{result.join(', ').to_s}"

  elsif menu_choice == 6
    puts
    print "Search by client name: "
    search_string = gets.chomp.downcase

    result = all_clients.find_all do |c|
    c.name == search_string
    end
    puts "#{result.join(',').to_s}"

  elsif menu_choice == 7
    puts "SEE YA!"
    puts "ps, all your data has been lost. lol"
    Kernel.exit

  else
    puts "Unknown option, restarting."
    # start_menu
  end
binding.pry
end #end for the while function this whole program is wrapped in!