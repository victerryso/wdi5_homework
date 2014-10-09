require 'pry-debugger'

require_relative 'building.rb'
require_relative 'apartment.rb'
require_relative 'tenant.rb'

building_list = []

# seed data
b1 = Building.new("124 fake st","gothic","no","yes",2)
b2 = Building.new("123 tralala st","art deco","no","yes",2)
a1 = Apartment.new(200,2,3)
a2 = Apartment.new(150,1,1)
t1 =  Tenant.new("bob",23,"male")
t2 =  Tenant.new("jill",5,"female")
# puts seed data into building_list array
building_list << b1 << b2
b1.apartments[707] = a1
a1.occupants << t1 << t2

def quit
   puts "Thanks!"
   Process.exit
end

def ask(question)
   puts question
   gets.chomp
end

def add_building(building_list)
   b = Building.new(ask('Street Address?'), ask('Style?'), ask('Doorman present?'), ask('Elevator present?'),ask('Number of floors?'))
   building_list << b
end

def add_apartment(building, building_list=building_list)
   a = Apartment.new(ask('Area of the apartment? (Square feet)'), ask('How many bedrooms?'), ask('How many bathrooms?'))
   apt_number = ask("What's the number of the apartment?") # asks for key for hash
   building_list[ building.to_i ].apartments[ apt_number ] = a
   binding.pry
end

def add_tenant(apartment)
   t = Tenant.new(ask('Name of tenant?'),ask('Age?'),ask('Gender?'))
   apartments.occupants << t
end

def menu_add(building_list)
   add_things = ask("What do you want to add? (b)uilding, (a)partments or (t)enants?")
   case add_things
   when "b"
      add_building(building_list)
   when "a"
      # if building_list.empty?
      #    ask("There are no buildings! Do you want to add a building for this apartment?")
      #    add_building(building_list) if
      # else
         building = ask("What building does this belong to?") # asks for index of the building
         add_apartment(building,building_list)
      # end
   when "t"
      apartment = ask("Where is this person going to live?")
      add_tenant(apartment)
   else
      puts "Please enter valid input."
   end
end

def list_menu(building_list)
   list_things = ask("What do you want to check? (b)uilding, (a)partments or (t)enants?")
   case list_things
   when "b"
     puts building_list
   when "a"
      building_list.each do |building|
         puts buildings
         building.apartments.each { |apartment_num,apartment| puts "\t"apartment }
      end
   when "t"
      puts apartments.occupants
   else
      puts "Please enter valid input."
   end
end

def main_menu(building_list)
   main_menu_choice = ask("Do you want to (a)dd or get a (l)ist of things in the database?")
   if main_menu_choice == "a"
      menu_add(building_list)
   elsif main_menu_choice == "l"
      if building_list.empty?
         puts "Nothing to see here!"
      else
         list_menu(building_list)
      end
   else
      puts "Please enter a valid input."
   end
end

puts "\e[H\e[2J"
puts "=" * 20, "Apartments for rent", "=" * 20


main_menu(building_list)

# binding.pry