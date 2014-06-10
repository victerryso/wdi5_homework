require 'pry'
require 'pry-debugger'
require 'csv'

require_relative 'animal.rb'
require_relative 'client.rb'

#### SEED DATA ####

a1 = Animal.new("birdie", :bird, 2, :male, 3, :blue, :no, ["Parrot"], "Makes alot of noice in the morning")
a2 = Animal.new("jack", :dog, 5, :male, 6, :yellow, :yes, ["chew toys", "ropes"], "Loves bacon")
c1 = Client.new("walbyboy22", "Walbert", 45, 3, 2, ["sally", "alex"])
c2 = Client.new("faiball", "Fai", 20, 0, 0, [])

$clients = [c1, c2]
$animals = [a1, a2]

#### FORMATTING and INPUTS ####

def input_processing(prompt)
  print prompt + ": "
  gets.chomp.downcase
end

def capitalize_array(array_name)
  array_name.each.map do |x|
    x.capitalize
  end
end


def match_user(array, name)
  array.find{|client| client.username == name}
end

#### Menu ####

def root_menu
  print `clear`
  puts "Welcome to HappiTails Animal Shelter!\n"
  puts "What would you like to do? Navigate menu by typing item number:\n"
  puts "  1. Display all animals"
  puts "  2. Display all clients"
  puts "  3. Add a new animal"
  puts "  4. Add a new client"
  puts "  5. Adopt an animal"
  puts "  6. Put an animal up for adoption"
  puts "  0. Quit program" 
  menu_choice = input_processing("INPUT").to_i

  while menu_choice != 999
    case(menu_choice)
      when 1 then display_all_animals
      when 2 then display_all_clients
      when 3 then add_animal
      when 4 then add_client
      when 5 then adopt_animal
      when 6 then animal_up_adoption
      when 0 then quit
      else 
        menu_choice = 999
        puts "Invalid selection. Please try again"
    end
    menu_choice = input_processing("INPUT").to_i
  end
end

def quit
  puts "You have successfully exited the program."
  Process.exit
end

def return_root_menu
  menu_selection = input_processing("\nWould you like to do anything else? (Y/N)")
  if menu_selection == "y"
    root_menu
  else 
    puts "You have successfully exited the program."
    Process.exit
  end
end

#### Create a new animal ####

def display_all_animals
  print `clear`
  puts "DISPLAY - ALL ANIMALS (#{$animals.count})\n\n"
  $animals.each_with_index do |animal, index|
    index += 1
    puts "#{index}. #{animal.name.capitalize}\n  Species: #{animal.species.capitalize}\n  Age: #{animal.age}\n  Gender: #{animal.gender.capitalize} \n  Weight: #{animal.weight} kgs\n  Color: #{animal.color.capitalize}\n  Was neutered: #{animal.was_neutered.capitalize}\n  Toys: #{animal.toy}\n  Description: #{animal.description}\n\n"
  end
  return_root_menu
end

def display_all_clients
  print `clear`
  puts "DISPLAY - ALL CLIENTS (#{$clients.count})\n\n"
  $clients.each_with_index do |client, index| 
    index += 1
    puts "##{index}: #{client.name}\n  #{client.age} years old\n  Number of children: #{client.num_of_children}\n"
    if client.pets.empty?
      puts "  This client does not own any pets\n"
    else
      puts "  Number of pets: #{client.num_of_pets}\n  Name(s) of pets: #{capitalize_array(client.pets)}\n" # Would like to capitalize each name
    end
  end
  return_root_menu
end

def add_animal
  puts "=====ADD A NEW ANIMAL====="
  name = input_processing("Name").to_s
  binding.pry
  species = input_processing("Species").to_sym
  age = input_processing("Age").to_i
  gender = input_processing("Gender").to_sym
  weight = input_processing("Weight (kg.)").to_i
  color = input_processing("Color").to_sym
  was_neutered = input_processing("Was neutered? (Y/N)").to_sym
  toy = input_processing("Favorite toys(s) (separate by (,) commas").split(',')
  description = input_processing("Description")

  a = Animal.new(name, species, age, gender, weight, color, was_neutered, toy, description)
  
  $animals << a
  puts "You've successfully added #{name} to the database."
  return_root_menu
end

def add_client
  print `clear`
  puts "=====ADD A NEW CLIENT====="
  username = input_processing("Select username").to_s
  name = input_processing("Name").to_s
  age = input_processing("Age").to_i
  num_children = input_processing("Number of children").to_i
  current_pet_ownshp_conf = input_processing("Do you currently have pets? (Y/N)").to_s
  if current_pet_ownshp_conf == "y"
    # num_pets = input_processing("Number of pets").to_i
    pets = input_processing("Names of current pets (separate names by (,) comma)").split(',')
    num_pets = pets.count.to_i
  else pets = []
  end


  c = Client.new(username, name, age, num_children, num_pets, pets)
  $clients << c
  puts "You've succesfully added #{name.capitalize} to the database.\n#{name.capitalize}'s username is #{username}."
  return_root_menu
end

def donate_toy
  puts "=====DONATE A TOY====="
  display_all_animals
  animal_get_toy = input_processing("Which animal will get the toy? Enter name")
  $animals.find do |animal, name|
    animal = animal_get_toy
  end
  toy_name = input_processing("Identify toy").to_s
end

def adopt_animal
  print `clear`
  puts "ADOPT AN ANIMAL"
  current_client_confirm = input_processing("Are you/the adoptor a current client in the database? (Y/N)")
  # binding.pry
  case current_client_confirm
    when "y" 
        adoptor_username = input_processing("Adoptor's username")
        adoptor = match_user($clients, adoptor_username)
        puts "The adoptor's username is #{adoptor.username}"
          # if client[:username].match(adoptor_username)
          #   puts "You are in the system."
            # adoptor_username = input_processing("Invalid username, please try again")
          # else
          #   puts "You are not in the system."
          #   adoptor_username = input_processing("Adoptor's username")
              # adopt_confirm = nil
              # unless adopt_confirm == "y"
              #   print `clear`
              #   display_all_animals
              #   puts "which animal would you like to adopt? Please type in the animal's number"
              #   animal_adopt_choice_index = gets.chomp.to_i
              #   puts "Are you sure you want to adopt #{animal_adopt_choice_index}? (Y/N)"
              #   adopt_confirm = gets.chomp.downcase
              # else ### How to compare adoptor_username with client to know which client to insert animals in
              #   client.pets_list << $animals.delete_at[animal_adopt_choice_index] 
              # end
          # end
    when "n"
      user_input = input_processing("\nYou must be a registered client to adopt an animal.\n\nPress ENTER to register or type 'R' to return to menu").to_s
      case user_input
        when "" then add_client
        else root_menu
      end
  end
end

def animal_up_adoption
  current_client_confirm = nil
  print `clear`
  input_processing("Are you a current client? (Y/N)")
  unless current_client_confirm == "y"
    puts "Please register before proceeding."
    return_root_menu
  else
    puts "You may put your pet up for adoption."
  end
end

root_menu


#### PROGRAM ACTIVATION ####




