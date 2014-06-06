require 'pry'
require 'pry-debugger'

require_relative 'animal.rb'
require_relative 'client.rb'

#### SEED DATA ####

a1 = Animal.new("Birdie", :bird, 2, :male, 3, :blue, :no, "Makes alot of noice in the morning", "XYZ")
a2 = Animal.new("Jack", :dog, 5, :male, 6, :yellow, :yes, "Loves bacon", "XYZ")
c1 = Client.new("Walbert", 45, 3, 0, [])

$clients = [c1]

$animals = [a1, a2]

#### Create a new animal ####

#### Menu ####


puts "What would you like to do?\n"
puts "1. Display all animals"
puts "2. Display all clients"
puts "3. Add a new animal"
puts "4. Add a new client"
puts "5. Adopt an animal"
puts "6. Put an animal up for adoption" 


def input_processing(prompt)
  print prompt + ": "
  gets.chomp.downcase
end

def display_all_animals
  puts `clear`
  puts "List - ALL ANIMALS\n\n"
  $animals.each_with_index do |animal, index|
    puts "#{index}. #{animal.name.capitalize}: #{animal.age} yrsold #{animal.gender} #{animal.species}.\nWeight: #{animal.weight} kgs; Color: #{animal.color}; Was neutered: #{animal.was_neutered}\nToys: #{animal.toy}\nDescription: #{animal.description}"
    puts ""
  end
end

def display_all_clients
  puts `clear`
  puts "List - ALL CLIENTS\n\n"
  $clients.each do |client|
    puts "#{client.name}, #{client.age} yrsold\nNumber of children: #{client.num_children}\nNumber of pets: #{client.num_pets}"
    puts ""
  end
end

def add_animal
  puts "Add new animal"
  name = input_processing("Name").to_s
  binding.pry
  species = input_processing("Species").to_sym
  age = input_processing("Age").to_i
  gender = input_processing("Gender").to_sym
  weight = input_processing("Weight (kg.)").to_i
  color = input_processing("Color").to_sym
  was_neutered = input_processing("Was neutered? (Y/N)").to_sym
  toy = input_processing("Favorite toys(s)")
  description = input_processing("Description")

  a = Animal.new(name, species, age, gender, weight, color, was_neutered, toy, description)
  
  $animals << a
  puts "You've successfully added #{name} to the database."
end

def add_client
  puts "Add new client"
  name = input_processing("Name").to_s
  age = input_processing("Age").to_i
  num_children = input_processing("Number of children").to_i
  num_pets = input_processing("Number of pets").to_i
  pets_list = input_processing("Names of current pets (separate names by (,) comma").split(',')

  c = Client.new(name, age, num_children, num_pets, pets_list = [])
  $clients << c
  puts "You've succesfully added client #{name.capitalize} to the database."
end

def adopt_pet
  adopt_confirm = nil
  unless adopt_confirm == "y"
    puts `clear`
    display_all_animals
    puts "which animal would you like to adopt? Please type in the animal's number"
    animal_adopt_choice_index = gets.chomp.to_i
    puts "Are you sure you want to adopt #{animal_adopt_choice_index}? (Y/N)"
    adopt_confirm = gets.chomp.downcase
  else
    client.pets_list << $animals.delete_at[animal_adopt_choice_index] 
  end
end

adopt_pet


