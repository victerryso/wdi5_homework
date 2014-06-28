require 'pry'
require 'pry-debugger'

require_relative 'animal'
require_relative 'client'
require_relative 'shelter'


def greet
  puts "====================================="
  puts "      HAPPITAILS MNGMT SOFTWARE      "
  puts "====================================="
  puts "(1) add animal,"
  puts "(2) add client,"
  puts "(3) display all animals,"
  puts "(4) display all clients,"
  puts "(5) client adopts an animal,"
  puts "(6) client puts and animal up for adoption,"
  puts "(7) donate toy(s) to animal at Happitails"
  puts "(q) to quit program.."
  greet = gets.chomp
end

def director
  response = greet
  if response == '1'
    add_animal
  elsif response == '2'
    add_client
  elsif response == '3'
    list_animals
  elsif response == '4'
    list_clients
  elsif response == '5'
    client_adopt
  elsif response == '6'
    client_disown
  elsif response == '7'
    donate_toys
  elsif response == 'q'
    puts "Quitting.."
    Kernel.exit
  end
end

def add_animal
  puts "What is the animals name? "
  name = gets.chomp.capitalize
  puts "What is the animals age? "
  age = gets.to_i
  puts "What is the animals gender? "
  gender = gets.downcase.to_sym
  puts "What is the animals species? "
  species = gets.downcase.to_sym
  puts "What toy does #{name} have? "
  new_toys = gets.downcase.to_s

  new_animal = Animal.new(name, age, gender, species)
  new_animal.toys << new_toys
  $happitails.animals_in_shelter << new_animal
end

def list_animals
  $happitails.animals_in_shelter.each_with_index do |a, i|
    puts '---------------------------------'
    print "#{ i + 1 }: #{ a }"
    puts
    puts '---------------------------------'
    puts
  end
end

def add_client
  puts "What is the clients first name? "
  first_name = gets.chomp.capitalize
  puts "What is the clients last name? "
  last_name = gets.chomp.capitalize
  puts "How many children does the client have? "
  num_children = gets.to_i
  puts "Client age? "
  age = gets.to_i
  puts "How many pets does this client have? "
  num_pets = gets.to_i

  new_client = Client.new(first_name, last_name, num_children, age, num_pets)
  $happitails.clients << new_client
end

def list_clients
  $happitails.clients.each_with_index do |c, i|
    puts '---------------------------------'
    print "#{ i + 1 }: #{ c }"
    puts
    puts '---------------------------------'
    puts
  end
end

def client_adopt
  puts `clear`
  list_clients
  puts "Which client is adopting? Enter client number: "
  client_no = gets.to_i

  puts `clear`
  client_select = $happitails.clients[client_no - 1]
  puts '---------------------------------'
  puts "Client selected: #{client_select}"
  puts '---------------------------------'
  puts; puts

  puts "List of currently available animals: "
  list_animals
  puts "Which animal is the client adopting? Enter animal number: "
  animal_no = gets.to_i

  animal_select = $happitails.animals_in_shelter[animal_no - 1]
  puts '---------------------------------'
  puts "Animal selected: #{animal_select}"
  puts '---------------------------------'

  client_select.pets_from_shelter << animal_select
  puts "Adoption complete! #{client_select.pets_from_shelter}"
  $happitails.animals_in_shelter.delete_at(animal_no - 1)
end

def client_disown
  puts `clear`
  list_clients
  puts "Which client is disowning? Enter client number: "
  client_no = gets.to_i

  client_select = $happitails.clients[client_no - 1]
  puts '---------------------------------'
  puts "Client selected: #{client_select}"
  puts '---------------------------------'
  puts

  puts "What is the animals name? "
  name = gets.chomp.capitalize
  puts "What is the animals age? "
  age = gets.to_i
  puts "What is the animals gender? "
  gender = gets.downcase.to_sym
  puts "What is the animals species? "
  species = gets.downcase.to_sym
  puts "What toy does #{name} have? "
  new_toys = gets.downcase.to_s

  new_animal = Animal.new(name, age, gender, species)
  new_animal.toys << new_toys
  $happitails.animals_in_shelter << new_animal

  client_select.disowned_pets << new_animal
end

def donate_toys
  puts `clear`
  list_animals
  puts "which animal would you like to donate toy(s) to? "
  animal_no = gets.to_i

  animal_select = $happitails.animals_in_shelter[animal_no - 1]
  puts '---------------------------------'
  puts "Animal selected: #{animal_select}"
  puts '---------------------------------'

  puts "How many toys do you need to add? "
  x = gets.to_i

  x.times do
    puts "Which toy would you like to give to #{animal_select}? "
    new_toy = gets.chomp
    animal_select.toys << new_toy
  end
end


$happitails = Shelter.new

# SEEDS
spotty = Animal.new('Spotty', 5, :male, :dog)
$happitails.animals_in_shelter << spotty

fredrick = Animal.new('Fredrick', 8, :male, :monkey)
$happitails.animals_in_shelter << fredrick

edward = Animal.new('Edward', 90, :female, :tortoise)
$happitails.animals_in_shelter << edward

dave = Client.new('Dave', 'Bents', 2, 33)
$happitails.clients << dave

sophie = Client.new('Sophie', 'Fifi', 12, 22)
$happitails.clients << sophie

john = Client.new('Join', 'Smith', 0, 55)
$happitails.clients << john

director


puts "Another entry?(y/n) "
re_entry = gets.chomp

if re_entry == 'n'
  puts ' '
else
  puts "How many entries would you like to make? "
  ent = gets.to_i

  ent.times do
    director
  end
end

binding.pry





