require 'pry'
require 'pry-debugger'

require_relative 'apartment'
require_relative 'building'
require_relative 'tenant'

$building = []
$apartments = []
$tenants = []

def greet
puts "============================="
puts "           WELCOME           "
puts "============================="
puts "(a)partment, (b)uilding, (t)enant database, or, (q)uit? "
greet = gets.chomp
end

def director
  response = greet
  if response == 'a'
    apart_menu
  elsif response == 'b'
    building_menu
  elsif response == 't'
    tenant_menu
  elsif response == 'q'
    puts "Quitting.."
    Kernel.exit
  end
end

def apart_menu
  puts "============================="
  puts "      APARTMENT MANAGER      "
  puts "============================="
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
  puts "What is the value?($) "
  value = gets.chomp
  puts "How many square feet? "
  sqft = gets.chomp
  puts "How many bedrooms? "
  num_bedrooms = gets.chomp
  puts "How many bathrooms? "
  num_bathrooms = gets.chomp

  apt = Apartment.new(value, sqft, num_bedrooms, num_bathrooms)
  $apartments << apt
end

def list_apart
  $apartments.each do |a|
    puts a
  end
end

def list_avail
end

def building_menu
  puts "============================="
  puts "      BUILDING MANAGER       "
  puts "============================="
  puts "(a)dd, (l)ist all"
  building_response = gets.chomp
  case building_response
  when 'a'
    add_building
  when 'l'
    list_building
  end
end

def add_building
  puts "What's the address? "
  address = gets.chomp
  puts "What's the style? "
  style = gets.chomp
  puts "Is there a Doorman?(true/false) "
  has_doorman = gets.chomp
  puts "Is there an Elevator?(true/false) "
  has_evelator = gets.chomp
  puts "How many floors? "
  num_floors = gets.chomp

  bui = Building.new(address, style, has_doorman, has_evelator, num_floors)
  $buildings << bui
end

def list_building
  $buildings.each do |b|
    puts b
  end
end

def tenant_menu
  puts "============================="
  puts "       TENANT MANAGER        "
  puts "============================="
  puts "(a)dd, (l)ist all, (m)ove, a(d)d to apartment, (r)emove"
  tenant_response = gets.chomp
  case tenant_response
  when 'a'
    add_tenant
  when 'l'
    list_tenant
  when 'm'
  when 'd'
  when 'r'
  end
end

def add_tenant
  puts "Name? "
  name = gets.chomp
  puts "Age? "
  age = gets.chomp
  puts "Gender? "
  gender = gets.chomp

  ten = Tenant.new(name, age, gender)
  $tenants << ten
end

def list_tenant
  $tenants.each_with_index do |t, i|
    print "#{ i + 1 }) "
    puts t
  end
end

def move_tenant
  list_tenant
  print "Please select a tenant number: "
  tenant_no = gets.to_i

  puts "Here is your tenant:"
  tenant = $tenants[tenant_no - 1]
  puts tenant

  list_apart
  print "Please select an apartment number: "
  apartment_no = gets.to_i
  $apartments[apartment_no - 1].occupants << tenant
end


director


puts "Another entry?(y/n) "
re_entry = gets.chomp

if re_entry == 'n'
  puts ' '
else
  puts "How many entries would you like to make? "
  ent = gets.chomp.to_i

  ent.times do
    director
  end
end





# Seed data



binding.pry
