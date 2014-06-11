require 'pry'
require 'pry-debugger'

require_relative 'animal.rb'
require_relative 'client.rb'
require_relative 'shelter.rb'

kity = Animal.new('Kity', 2, :Female, :Cat)
  kity.toys << 'Mini Mouse'
dooby = Animal.new('Dooby', 1, :Male, :Dog)
  dooby.toys << 'Big Bone'

rira = Client.new('Rira Choi', 0, 27)
  rira.pets << kity.name
jack = Client.new('Jack Smith', 2, 34)
  jack.pets << dooby.name

$happitails = Shelter.new
$happitails.list_clients << rira << jack # save as the object.
$happitails.list_animals << kity << dooby

def animal_add
  p "Adoption Process --------- Select following options "
  p "  A. Adoption        B. Put a Pet Up for Adoption   "
  p "+-------------------------------------------------+ "
  p "|----------- press (M) for Main Menu -------------| "
  p "+-------------------------------------------------+ "
  adoption_choice = gets.chomp.upcase
    if adoption_choice == "A"
      puts " "
      p "Here is our pet list, "
      $happitails.list_animals.each {|x| puts x.info}
      puts " "
      p "Please Select one of them and Type Its Name: "
      animal_name = gets.chomp.capitalize
      puts " "
      p "Here is our client list, "
      $happitails.list_clients.each {|x| puts x.info}
      p "Please Select client and Type his/her Name: "
      client_name = gets.chomp.capitalize
      # getting client index and animal index to push new items
      client_index = 0
      animal_index = 0
      $happitails.list_animals.each_with_index { |name, ani_index|
        if name.name == animal_name
          animal_index = ani_index end }
      $happitails.list_clients.each_with_index { |name, clie_index|
        if name.name == client_name
          client_index = clie_index end }
      # finding the client in the list_client with client_index and doing samething for the pet
      $happitails.list_animals[animal_index].comment = :Unavailable
      # changing the comment 'Available' to 'Unavailable'
      $happitails.list_clients[client_index].pets << $happitails.list_animals[animal_index].name
      puts "'#{ animal_name }'' has been adopted by '#{ client_name }': "
      puts $happitails.list_clients[client_index].info

    elsif adoption_choice == "B"
      p "Add New Animal ----- Name : "
      name = gets.chomp.to_s.capitalize
      p "Add New Animal ----- Age : "
      age = gets.chomp.to_i
      p "Add New Animal ----- Gender : "
      gender = gets.chomp.to_sym.capitalize
      p "Add New Animal ----- Species : "
      species = gets.chomp.to_sym.capitalize
      p "Add New Animal ----- Does it have any Toys? (optional): "
      toys = gets.chomp.to_s.capitalize
      new_pet= Animal.new(name, age, gender, species, toys)
      new_pet.toys << toys
      p " A new pet has been added: "
      puts new_pet.info
      $happitails.list_animals << new_pet

    else adoption_choice == "M"
      p main_menu
    end
end

def client_add
  p "Add New Client ----- Name : "
  name = gets.chomp.to_s.capitalize
  p "Add New Client ----- Age : "
  age = gets.chomp.to_i
  p "Add New Client ----- The Number of Childern : "
  num_children = gets.chomp.to_i
  p "Add New Client ----- Dose the Cilent have any Pets?(optional): "
  pets = gets.chomp.to_s.capitalize
  new_client = Client.new(name, num_children, age, pets)
  new_client.pets << pets
  p " A new client has been added: "
  puts new_client.info
  $happitails.list_clients << new_client
  # $happitails.list_clients << "#{ name }" #  with '' for string --- client_1 = #{name}!!!

end

def delete_animal
  p "----------------------------------------------------------------"
  p "Would you like to undopt a Pet and Put the pet up for Adoption? "
  p "--------- [Yes] to proceed --------- [No] for Main Menu --------"
  p "----------------------------------------------------------------"
  delete_choice = gets.chomp.to_s.downcase
  if delete_choice == "yes"
  p "Here is our client list, "
  $happitails.list_clients.each {|x| puts x.info} # Don't type 'p' the front to see only info !!!
  p "Unadopt a Pet ---- Type The Client Name: "
  unadopting_client = gets.chomp.capitalize
  # getting the client index
  unadopting_client_index = 0
  $happitails.list_clients.each_with_index { |name, clie_index|
    if name.name == unadopting_client
      undopting_client_index = clie_index end }
  p $happitails.list_clients[unadopting_client_index].info
  p $happitails.list_clients[unadopting_client_index].pets_names
  # getting the pet index in client.pets
  p "Unadopt a Pet ---- Type the Name of Pet to be Undopted: "
  unadopted_pet = gets.chomp.capitalize
  unadopted_pet_index = 0
  $happitails.list_clients[unadopting_client_index].pets.each_with_index { |name, ani_index|
    if name == unadopted_pet
      unadopted_pet_index = ani_index end }
  $happitails.list_clients[unadopting_client_index].pets.delete_at(unadopted_pet_index)
  p "The pet has been unadopted, "
  p $happitails.list_clients[unadopting_client_index].info
  p $happitails.list_clients[unadopting_client_index].pets_names
  # changing the comment with animal index in the list_animal
  $happitails.list_animals.each_with_index { |object, ob_index|
    if object.name == unadopted_pet.to_s
    $happitails.list_animals[ob_index].comment = :Available
    end }
  else delete_choice == "no"
      main_menu
  end

end

def main_menu
  puts " "
  puts "+ ------------------------------------------------- + "
  puts "| + - -----***  WELCOME  to  HAPPITAILS  ***---- - +| "
  puts "|          Select following options, please         | "
  puts "| 1. Add a New Client      2. Adoption Process      | "
  puts "| 3. Display Client List   4. Display Pet List      | "
  puts "| 5. Unadopt a Pet                                  |"
  puts "| ------------- Press (q) to quite -----------------| "
  puts "+ ------------------------------------------------- + "
  main_choice = gets.chomp.to_s

  case main_choice
    when "1" then client_add
    when "2" then animal_add
    when "3" then $happitails.list_clients.each {|x| puts x.info}
    when "4" then $happitails.list_animals.each {|x| puts x.info}
    when "5" then delete_animal
    else  p "Oops, Error!! try again"
    end
end

response = main_menu

until response == "q"
    response = main_menu
    if response == 'q'
       p "Thank you. See you again :D "
       Kernel.exit
    end
end


binding.pry


