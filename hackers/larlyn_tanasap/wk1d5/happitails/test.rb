require 'pry-debugger'
require 'csv'

require_relative 'shelter.rb'
require_relative 'client.rb'
require_relative 'animal.rb'

$happitails = Shelter.new
# seed data
            loki = Animal.new(:cat,"Loki",2,:male)
               loki.toys << "frost giant scum" << "Horns"
            thor = Animal.new(:dog,"Thor",2,:male)
               thor.toys << "Mjolnir"
            tony = Animal.new(:dog,"Tony",3,:male)
               tony.toys << "SCIENCE!!"
            natasha = Animal.new(:spider,"Natasha",1,:female)
               natasha.toys << "Poison" << "Kung-fu or something"

            $happitails.animals_in_shelter << natasha
            $happitails.animals_in_shelter << tony

            odin = Client.new("god","Odin Allfather",2,300)
            $happitails.list_of_clients << odin
               odin.client_pets << thor
               odin.client_pets << loki
            nick = Client.new("eyepatch","Nick Fury",0,30)
            # $happitails.list_of_clients << nick

# CSV.foreach('pets_with_us.csv') do |row|
#   $happitails.animals_in_shelter << new_pet = (Animal.new(row[0], row[1], row[2], row[3]))
#   new_pet.toys = row[4].split(",")
# end

# CSV.open('pets_with_us.csv', 'w') do |csv|
#   # For all the pets:
#   $happitails.animals_in_shelter.each do |pet|
#     # Add a new row, with these fields in order:
#     csv << [
#       pet.species,
#       pet.name,
#       pet.age,
#       pet.gender,
#       pet.toys.join(",")
#     ]
#   end
# end

CSV.foreach('clients.csv') do |row|
  $happitails.list_of_clients << new_client.push(Client.new(row[0], row[1], row[2], row[3]))
  $happitails.list_of_clients.each do |client|
  row[4].split(",")
      row[4].each do |attrib|
         client.client_pets << new_pet = (Animal.new(attrib[3], attrib[4], attrib[2], attrib[3]))
      end
  end
end

# CSV.open('clients.csv', 'w') do |csv|
#   $happitails.list_of_clients.each do |client|
#    my_pets = []
#       client.client_pets.each do |pet|
#          my_pets.push([pet.species,pet.name,pet.age,pet.gender,pet.toys])
#       end
#     csv << [
#       client.username,
#       client.name,
#       client.age,
#       client.kids,
#       my_pets.join(",")
#     ]
#   end
# end

binding.pry


# $happitails.animals_in_shelter.map(&:name) # => ["Loki", "Tony", "Natasha"]
