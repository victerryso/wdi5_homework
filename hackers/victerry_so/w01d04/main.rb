require "pry"
require "pry-debugger"

require_relative "apartment"
require_relative "building"
require_relative "tenant"

def main_menu
  puts "Main Menu\nWhat would you like to change?\n-Buildings\n-Apartments\n-Tenants\n-Quit"
  gets.chomp.downcase
end

def buildings_menu
  puts "Buildings\nWould you like to:\n-List\n-View\n-Add\n-Edit\n-Delete"
  gets.chomp.downcase
end

def apartment_menu
  puts "Apartments\nWould you like to:\n-List\n-View\n-Add\n-Edit\n-Delete\n-Add to Building"
  gets.chomp.downcase
end

def tenants_menu
  puts "Tenants\nWould you like to:\n-List\n-View\n-Add\n-Edit\n-Delete\n-Add to Apartment"
  gets.chomp.downcase
end

buildings_hash = {}
apartments_hash = {}
tenants_hash = {}

b1 = Building.new("100 Main St", :art_deco, false, true, 18)
buildings_hash["b1"] = b1

b2 = Building.new("102 Main St", :art_deco, false, true, 18)
buildings_hash["b2"] = b2

a1 = Apartment.new(2500, 3, 2)
apartments_hash["a1"] = a1

a2 = Apartment.new(1100, 4, 4)
apartments_hash["a2"] = a2

t1 = Tenant.new("Someone", 20, :male)
tenants_hash["t1"] = t1

t2 = Tenant.new("Somegirl", 25, :female)
tenants_hash["t2"] = t2


t2()

input = main_menu
if input == "buildings"
  input = buildings_menu
  if input == "list"
    puts buildings_hash.values
  elsif input == "view"
    puts "Which building would you like to view?"
    view = gets.chomp
    building = buildings_hash[view]
    puts "#{building.to_s}"
  elsif input == "add"
    print "Name: "
    name = gets.chomp
    print "Address: "
    address = gets.chomp
    print "Style: "
    style = gets.chomp
    print "Doorman(True/False)"
    has_doorman = gets.chomp
    print "Elevator(True/False)"
    has_elevator = gets.chomp
    print "No. Floors: "
    num_floors = gets.chomp
    name = gets.chomp
    code = "#{name} = Building.new(address, style, has_doorman, has_elevator, num_floors)"
    eval code
    name = Building.new(address, style, has_doorman, has_elevator, num_floors)
    buildings_hash["name"] = name
    puts "#{name}\nBuilding Added."
    puts buildings_hash
  elsif input == "edit" # I'll get around to this...
    puts "Please choose the building you wish to edit"
    gets.chomp.downcase
  elsif input == "delete"
    puts "Which building would you like to delete?"
    delete = gets.chomp.downcase
    buildings_hash.delete(delete)
  end
end

if input == "apartments"
  input = apartment_menu
  if input == "list"
    puts apartments_hash.values
  elsif input == "view"
    puts "Which apartment would you like to view?"
    view = gets.chomp
    apartment = apartments_hash[view]
    puts "#{apartment.to_s}"
  elsif input == "add"
    print "Name: "
    name = gets.chomp
    print "Square Feet: "
    sqft = gets.chomp
    print "No. Bedrooms: "
    num_bedrooms = gets.chomp
    print "No. Bathrooms: "
    num_bathrooms = gets.chomp
    name = Apartment.new(sqft, num_bedrooms, num_bathrooms)
    apartments_hash["name"] = name
    puts "#{name}\napartment Added."
    puts apartments_hash
  elsif input == "edit" # I'll get around to this...
    puts "Please choose the apartment you wish to edit"
    gets.chomp.downcase
  elsif input == "delete"
    puts "Which apartment would you like to delete?"
    delete = gets.chomp.downcase
    apartments_hash.delete(delete)
  elsif input == "add to building" # I'll get around to this...
    print "Name the apartment you wish to add: "
    name = gets.chomp.downcase
    print "Name the building you wish to move them to: "
    building_move = gets.chomp.downcase
  end
end

if input == "tenants"
  input = tenants_menu
  if input == "list"
    puts tenants_hash.values
  elsif input == "view"
    puts "Which tenant would you like to view?"
    view = gets.chomp
    tenant = tenants_hash[view]
    puts "#{tenant.to_s}"
  elsif input == "add"
    print "Name: "
    nom = gets.chomp
    print "Age: "
    age = gets.chomp
    print "Gender: "
    gender = gets.chomp
    name = Tenant.new(nom, age, gender)
    tenants_hash["name"] = name
    puts "#{name}\nTenant Added."
  elsif input == "edit" # I'll get around to this...
    puts "Please choose the tenant you wish to edit"
    gets.chomp.downcase
  elsif input == "delete"
    puts "Which tenant would you like to delete?"
    delete = gets.chomp.downcase
    tenants_hash.delete(delete)
  elsif input == "add to apartment" # I'll get around to this...
    print "Name the person you wish to add: "
    name = gets.chomp.downcase
    print "Name the apartment you wish to move them to: "
    apartment_move = gets.chomp.downcase
    apartment_move.apartments << name
  end
end