require 'pry'
require 'pry-debugger'
require 'csv'
require_relative 'animal.rb'
require_relative 'client.rb'
require_relative 'menupage'
require_relative 'arraytoobject'
#### SEED DATA ####

a1 = Animal.new("Birdie", :bird, 2, :male, 3, :blue, :no, "Makes alot of noice in the morning", "XYZ")
a2 = Animal.new("Jack", :dog, 5, :male, 6, :yellow, :yes, "Loves bacon", "XYZ")
c1 = Client.new("Walbert", 45, 3, [a1])
shelter = Client.new("HappiTails", 0 , 0 , [a2])
$clients = [c1,shelter]

$animals = [a1, a2]

#### Load from CSV ####
#helpers
#call options select object object
def move(owners, object_being_moved, object_destination)
  original_owner = nil
  owners.each do |owner|
    if owner.array.include? object_being_moved
      original_owner = owner
      object_destination.array << owner.array.delete(object_being_moved)
    end
  end
  puts "#{object_being_moved} moved to #{object_destination} from #{original_owner}"
end
#### Menu ####

client_menu = MenuPage.new(ArrayToObject.new($clients))
animal_menu = MenuPage.new(ArrayToObject.new($animals))
menu_hierarchy = []
#binding.pry
loop do
  puts `clear`
  puts "HappiTails Database System"
  puts '======================================='
  puts '1. Client List and Operations'
  puts '2. Animal List and Operations'
  puts '3. Move animals'
  puts '4. Quit and Save'

  option = gets.chomp.to_i
  case option
  when 1
    menu_hierarchy << client_menu
    loop do
      loop do
        current_menu_obj = menu_hierarchy[-1]
        current_menu_obj.display_options(current_menu_obj.object_array)
        current_menu_obj.options_select(current_menu_obj.object_array)
        if current_menu_obj.option.class != String
          if current_menu_obj.option.methods.include? :array
            new_menu_obj = MenuPage.new(current_menu_obj.option)
            menu_hierarchy << new_menu_obj
          end
        end
        break if current_menu_obj.option == 'b'
      end
      menu_hierarchy.pop
      break if menu_hierarchy.length == 0
  end
  when 2
    animal_menu.display_options(animal_menu.object_array)
    animal_menu.options_select(animal_menu.object_array)
  when 3
    animal_menu.display_options(animal_menu.object_array)
    puts "Choose animal to move"
    animal = animal_menu.options_select(animal_menu.object_array)
    client_menu.display_options(client_menu.object_array)
    puts "Move #{animal} to where?"
    client = client_menu.options_select(client_menu.object_array)
    move($clients,animal, client)
  end

  break if option == 4
end
CSV.open('clients.csv','w',
  :write_headers=> true,
    :headers => ["name","num_of_children","age","array"] #< column header
  ) do|hdr|
  binding.pry
    $clients.each do |client|
      hdr << [client.name,  client.num_of_children, client.age, client.array]
    end
  end

