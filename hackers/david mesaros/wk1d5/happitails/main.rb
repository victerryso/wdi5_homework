require 'pry'
require 'pry-debugger'

require_relative 'animal'
require_relative 'client'
require_relative 'shelter'
$animal = []
$client = []


 def delete_client
 s1 = Shelter.new("@client"," @animals_shelter"," @animals_clients")
 p "list of Names to remove from Shelter"
 a = s1.clients
 puts a.map { |i| "'" + i.to_s + "'" }

 p "Please select name to remove"
 puts = gets.chomp
 end

def list_for_animals
   a1 =  Animal.new("Benjo", 6, "Male", "Pitbull")
   a2 =  Animal.new("Lessie",1, "female", "Collie")
   p "#{a1}"
   p "#{a2}"
   p " ==================== "
   

end

def list_of_clients
   c1 =  Client.new("Dave","", 29, 0)
   c2 =  Client.new("Frances","", 29, 1)
   p "#{c1}"
   p "#{c2}"
   p " ==================== "

end



def menu
	
	puts"Welcome!"
	puts"Would you like to add an (a)nimal or (c)lient"
    puts"======================"
	puts"To view the list of all the a(n)inals and c(l)ients"
    puts"====================="
	puts "To remove an an(i)nal or Clien(t) for the Shelter list "
	puts"====================="
	puts"Or (q)uit"
	puts = gets.chomp
end

def directory
	response = menu
	if response == 'a'
	puts "Please fill in details of the animal"
	animal_details
    elsif response == 'c'
    puts "Please fill in details of the client"
    client_details
    elsif response == 'n'
    puts "Here is current list of animal"
    puts " =============="
    list_for_animals

    elsif response == "l"
    puts " Here is current list of Clients"
    puts " =============="
    list_of_clients
    elsif response == "t"
    	puts " =============="
    	delete_client
    	

    else response == "q"
    	puts "Quiting"
    	Kernel.exit

    end
end
  
def animal_details
	puts "What is the animal name"
	name = gets.chomp
	puts "What is the animal ages"
	age = gets.chomp
	puts "What is the animal gender"
	gender = gets.chomp
	puts "What is the animal species"
	species = gets.chomp

    animal =  Animal.new(name,age,gender,species)
    $animal << animal
    binding.pry

end

def client_details

	puts "What is the client name"
	name = gets.chomp
	puts "Does the cleint have any children, (y)es or (n)o"
	children = gets.chomp
	puts "What is the cleint' age"
	age = gets.chomp
	puts "Does the client have any pets, (y)es or (n)o"
	pets = gets.chomp

    client = Client.new(name,children,age,pets)
    $client << client
    binding.pry
end


while true
directory
puts "========="
end