require 'pry'
require 'pry-debugger'

require_relative 'apartment'
require_relative 'building'
require_relative 'tenant'

$buildings = []
$apartments = []
$tenants = []

def greet
puts "============================="
puts "      Building Database      "
puts "============================="
puts "(a)partment, (b)uilding, (t)enant or, (q)uit? "
puts = gets.chomp
end

def director # Origin selector
  response = greet
  if response == 'a'
  puts "You have selected Apartments!"
      apart_menu
  elsif response == 'b'
  puts "You have selected Buildings!"
      building_menu
  elsif response == 't'
  puts "You have selected Tenants!"
      tenant_menu
  elsif response == 'q'
  puts "Quitting"
  Kernel.exit
  end
end

def apart_menu
  puts "************************"
  puts "   Apartment Manager    "
  puts "************************"
  puts "(a)dd, (l)ist all, list a(v)ailable"
  apart_response = gets.chomp
  case apart_response
  when 'a'
    add_apart
  when 'l'
    list_apart
  when 'v'
    list_avail
  end
end

def add_apart
  puts "What is the square footage? "
  sqft = gets.chomp
  puts "How many bedrooms? "
  num_bedrooms = gets.chomp
  puts "How many bathrooms? "
  num_bathrooms = gets.chomp
# Pushes gathered apartment data to $apartment array to be used in lists.
  apart = Apartment.new(sqft, num_bedrooms, num_bathrooms)
  $apartments << apart
  binding.pry
end

def list_apart
  $apartments.each do |a|
    puts a
  end
end

def building_menu
  puts "************************"
  puts "    Building Manager    "
  puts "************************"
  puts "(a)dd or (l)ist all"
  building_response = gets.chomp
  case building_response
  when 'a'
    add_build
  when 'l'
    build_list
  end
end

def add_build # contains all relevant data to 'buildings'
  puts "Building Database, Please enter the required information:"
  puts "*********************************************************"
  puts "Enter Building Address"
  address = gets.chomp
  puts "What is the Building Style"
  style = gets.chomp
  puts "Does the Building have a doorman? True or False"
  has_doorman = gets.chomp.upcase
  puts "Does the Building have an elevator? True or False"
  has_elevator = gets.chomp.upcase
  puts "How many floors does the Building have?"
  no_floors = gets.chomp
  puts "How many apartments does the Building have?"
  no_apart = gets.chomp
  # pushes data to array
  build = Building.new(address, style, has_doorman, has_elevator, no_floors, no_apart)
  $buildings << build
  binding.pry
end

def build_list
  $buildings.each do |b|
    puts b
  end
end

def tenant_menu
  puts "************************"
  puts "     Tenant Manager     "
  puts "************************"
  puts "(a)dd or (l)ist all"
  tenant_response = gets.chomp
  case tenant_response
  when 'a'
    add_tenant
  when 'l'
    tenant_list
  end
end
# contains all relevant data to tenants
def add_tenant
  puts "What is the tenants full name?"
  name = gets.chomp
  puts "What is the tenants age?"
  age = gets.chomp
  puts "What is the tenants gender?"
  gender = gets.chomp
  # push to array command
  tenants = Tenant.new(name, age, gender)
  $tenants << tenants
  binding.pry
end

def tenant_list
  $tenants.each do |t|
    puts t
  end
end
# the greatest loop to ever exist
  director
while true
  director
end