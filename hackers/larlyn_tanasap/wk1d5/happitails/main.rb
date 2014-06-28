require 'pry-debugger'
require 'csv'

require_relative 'shelter.rb'
require_relative 'client.rb'
require_relative 'animal.rb'

def quit
   puts 'Thanks for being a part of our family!'
   gets.chomp
   Process.exit
end

def ask(question)
   puts question
   gets.chomp
end
public
def titleize
   split(' ').map(&:capitalize).join(' ')
end

def restart
   gets.chomp
   start_menu
end

def find_username_match(username)
   $happitails.list_of_clients.find {|client| client.username == username }
end

def start_text
   puts "\e[H\e[2J"
   puts '=' * 30, '', 'Happitails animal management', '', '=' * 30
   puts 'What would you like to do?'
   puts "\t(1) Join us!"
   puts "\t(2) Adopt a pet?"
   puts "\t(3) Donate a toy to a pet?"
   puts "\t(4) Look at our clients"
   puts "\t(5) Look at our pets"
   puts "\t(6) Put a pet up for adoption? :\'( "
   puts "\tType (q) to quit"
   puts
end
   ## Menu functions
def donate_toy
   list_pets
   puts
   pet_name = ask('Who\'s getting this new toy?').capitalize
   pet_getting_toy = $happitails.animals_in_shelter.find {|pet| pet.name == pet_name }
   donated_toy = ask("What toy do you want to donate to #{ pet_getting_toy.name }?").capitalize
   pet_getting_toy.toys << donated_toy
   start_text
   puts "You've donated #{ donated_toy } to #{ pet_name }! Thanks!"
   restart
end

def new_pet
   pet = Animal.new(ask('What kind of animal is it?').downcase.to_sym, ask("What's the animals name?").titleize, ask('How old is it?').to_s, ask('What gender is it?').to_sym.downcase.to_sym)
   $happitails.animals_in_shelter << pet
   start_text
   puts "Added #{ pet.name } to our family!"
   list_pets
   restart
end

def new_client
   client = Client.new(ask('Please choose a username').downcase, ask('What\'s your name?').titleize, ask('How many kids have you got?').to_s, ask('How old are you?').to_s)
   $happitails.list_of_clients << client
   start_text
   puts "Thanks for joining us, #{ client.name }! Your username is #{ client.username }."
   restart
end

def list_pets
   start_text
   puts 'Here is a list of pets currently at our shelter:'
   puts
   $happitails.animals_in_shelter.each { |pet| pet.to_s }
end

def list_clients
   start_text
   puts 'Here are our clients, and their pets if they have any from us:'
   puts
   $happitails.list_of_clients.each { |client| client.to_s }
end

def adopt_pet
   username = ask('What is your username?').downcase
   adopter = find_username_match(username) #searches for a match
   list_pets
   pet_name = ask('Which pet are you adopting?').capitalize
   pet_being_adopted = $happitails.animals_in_shelter.find {|pet| pet.name == pet_name }
   adopter.client_pets << pet_being_adopted #give the pet to the client
   $happitails.animals_in_shelter.delete(pet_being_adopted)
   start_text
   puts "Thanks #{ adopter.name }, #{ pet_being_adopted.name } seems to like you already!"
   restart
end

def abandon_pet
   username = ask('What is your username?').downcase
   abandoner = find_username_match(username)
   if abandoner.client_pets.empty?
      start_text
      puts 'You don\'t have any pets!'
      restart
   else
      puts "You, #{ abandoner.name }, currently have these pets:"
      abandoner.client_pets.each {|pet| pet.to_s }
      pet_name = ask('Which pet are you bringing to our family?').capitalize
      pet_joining_us = abandoner.client_pets.find {|pet| pet.name == pet_name }
      $happitails.animals_in_shelter << pet_joining_us
      abandoner.client_pets.delete(pet_joining_us)
      start_text
      puts "Thanks #{ abandoner.name }, #{ pet_joining_us.name } will be very happy with us."
   end
   restart
end

def start_menu
   start_text
   choice = gets.chomp

   valid_input = (1..7).to_a
   if choice == 'admin'
      new_pet
   elsif choice == 'q'
      quit
   end
   unless valid_input.include? choice
      case choice
      when '1'
         new_client
      when '2'
         adopt_pet
      when '3'
         donate_toy
      when '4'
         list_clients
         restart
      when '5'
         list_pets
         restart
      when '6'
         abandon_pet
      end
      start_text
      puts 'Please input a valid choice.'
      restart
   end

end
######## END ALL FUNCTION DEFINITIONS
$happitails = Shelter.new
# seed data
            loki = Animal.new(:cat, 'Loki', 2, :male)
               loki.toys << 'frost giant scum' << 'Horns'
            thor = Animal.new(:dog, 'Thor', 2, :male)
               thor.toys << 'Mjolnir'
            tony = Animal.new(:dog, 'Tony', 3, :male)
               tony.toys << 'SCIENCE!!'
            natasha = Animal.new(:spider, 'Natasha', 1, :female)
               natasha.toys << 'Poison' << 'Kung-fu or something'

            $happitails.animals_in_shelter << loki
            $happitails.animals_in_shelter << tony
            $happitails.animals_in_shelter << natasha

            odin = Client.new('god', 'Odin Allfather', 2, 300)
            $happitails.list_of_clients << odin
               odin.client_pets << thor
            nick = Client.new('eyepatch', 'Nick Fury' , 0, 30)
            $happitails.list_of_clients << nick
# binding.pry
start_menu