require 'pry'
require 'pry-debugger'

require_relative 'apartment'
require_relative 'building'
require_relative 'tenant'

b1 = Building.new('240 Frost Street', :Modern, false, true, 5, 54)
b2 = Building.new('18 Old Street', :Gothic, false, false, 2, 21)

# Apartment
a1 = Apartment.new(123,1500, 2, 1)
a2 = Apartment.new(123, 800, 1, 1)
a3 = Apartment.new(123, 5000, 3, 2)
a4 = Apartment.new(123, 3500, 2, 2)

# Tenant
t1 = Tenant.new('Bill', 27, :male)
t2 = Tenant.new('Sally', 50, :female)
t3 = Tenant.new('Amy', 25, :female)
t4 = Tenant.new('Tom', 35, :male)
t5 = Tenant.new('Ros',24, :female)



# newbuilding= Building.new("Waterview", :Art, true, true, 1, 89)
# newbuilding.apartments[1].occupants << t1
# newbuilding.tenant << a1 << a2
apartments = {}
newbuilding = [b1, b2]
tenant_listing = [t1, t2, t3, t4]


puts "Welcome! I am the best Real Estate Agent the world has Ever seen! I can find what you need!"

loop do

  puts "Here at Ros's awesome we can do the following:"
  puts "-----------------"
  puts "Choose what you want to do?"
  puts "1. Create an building"
  puts "2. Create a apartment"
  puts "3. Create a tenant"
  puts "4. Look at apartment"
  puts "5. Look at tenant"
  puts "6. Remove tenant"
  puts "----------------"
  puts "To exit type --- q"
  user_command = gets.chomp.downcase


  if user_command == "1"
    puts "what is the address?"
    building_address = gets.chomp.downcase

    puts "what style is the building?"
    building_style = gets.chomp.to_sym

    puts "does the building have a doorman?"
    doorman_status = gets.chomp

    puts "does it have an elevator?"
    elevator_status = gets.chomp

    puts "how many floors does the building have?"
    building_floors = gets.chomp.to_i

    puts "What is the apartment?"
    building_apartment = gets.chomp.to_i

    building_create = Building.new(building_address, building_style, doorman_status, elevator_status, building_floors, building_apartment)

    p newbuilding.push(building_create)

  elsif user_command == "2"
    puts "what is the price of the apartment?"
    apart_price = gets.chomp.to_i

    puts "what is the size of the apartment in square feet?"
    apart_size = gets.chomp.to_i

    puts "how many bedrooms does the apartment have?"
    apart_bed = gets.chomp.to_i

    puts "how many bathrooms does it have?"
    apart_bath = gets.chomp.to_i

    apartment_create = Apartment.new(apart_price, apart_size, apart_bed, apart_bath)
    p apartment_create

    newbuilding.apartments.each do |key, value|
      apartment_create[key] = value
    end
    # apartments[Apartment].push(apartment_create)

  elsif user_command == "3"
    puts "What is the name of your name?"
    tenant_name = gets.chomp

    puts "what is their age?"
    tenant_age = gets.chomp.to_i

    puts "What is their gender?"
    tenant_gender = gets.chomp

    tenant_create = Tenant.new(tenant_name, tenant_age, tenant_gender)
    tenant_listing.push(tenant_create)


  elsif user_command == "4"
    puts newbuilding.apartments.map{|building| building.address}

    puts "what building do you want to see?"
    building_information = gets.chomp.downcase

    building_listing = newbuilding.apartment.find{|building| building.address == building_information }

    puts building_listing

  elsif user_command == "5"
    puts tenant_listing.map{|tenant| tenant.name}

    puts "What tenant do you want to see?"
    tenant_information = gets.chomp.downcase

    # have to find information linked to tenant name
    puts tenant_listing.map{|tenant| tenant == tenant_information}


  elsif user_command == "6"
    puts "What building is your tenant in?"
    building_address = gets.chomp.downcase
    building = newbuilding.apartment.find{|building| building.address == building_address}

    puts "what tenant do you want to remove?"
    puts building.occupants.map{|tenant| tenant.address}

    puts "choose the tenant to move"
    tenant_choice = gets.chomp.downcase

    tenant_to_remove = newbuilding.occupants.find{|tenant| tenant.address == tenant_choice}
    tenant_to_move = newbuilding.occupants.delete(tenant_to_remove)

    newbuilding.tenant << tenant_to_move

  elsif user_command == "q"
    Kernel.ext

  else
    puts "*************"
    puts "Please enter in a valid option"
    puts "*************"

  end
  break if user_command == "q"

end

binding.pry