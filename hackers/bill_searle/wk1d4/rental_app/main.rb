require 'pry'
require 'pry-debugger'

require_relative 'apartment'
require_relative 'building'
require_relative 'tenant'


# Storage arrays
$all_tenants = []
$all_buildings = []
$all_apartments = []

# Seed data
# Building
$all_buildings << b1 = Building.new('240 Frost Street', :Modern, false, true, 5)
$all_buildings << b2 = Building.new('18 Old Street', :Gothic, false, false, 2)
$all_buildings << b3 = Building.new('62 A Place', :Modern, true, true, 3)
$all_buildings << b4 = Building.new('28 Another Place ', :Ranch, false, false, 6)

# Apartment
$all_apartments << a1 = Apartment.new(1500, 2, 1)
$all_apartments << a2 = Apartment.new(800, 1, 1)
$all_apartments << a3 = Apartment.new(5000, 3, 2)
$all_apartments << a4 = Apartment.new(3500, 2, 2)

# Tenant
$all_tenants << t1 = Tenant.new('Bill', 27, :male)
$all_tenants << t2 = Tenant.new('Rose', 24, :female)
$all_tenants << t3 = Tenant.new('Amy', 25, :female)
$all_tenants << t4 = Tenant.new('Tom', 35, :male)

# binding.pry

# def the start menu
def start_menu
  puts "Please select from the follow options:"
  puts "Add a  (t)enant,"
  puts "Add a  (b)uilding,"
  puts "Add an (a)partment"
  puts "OR"
  puts "View all (bu)ildings,"
  puts "View all (ap)artments,"
  puts "View all (te)nants"
  puts "(Q)uit"

  menu_choice = gets.chomp.downcase

  if menu_choice == 't'
    add_tenant
  elsif menu_choice == 'b'
    add_building
  elsif menu_choice == 'a'
    add_apartment
  elsif menu_choice == 'bu'
    view_all_buildings
  elsif menu_choice == 'ap'
    view_all_apartments
  elsif menu_choice == 'te'
    view_all_tenants
  elsif menu_choice == 'q'
    puts "SEE YA!"
    Kernel.exit
  else
    puts "Unknown option, restarting."
    start_menu
  end
end

# Method for adding a new tenant
def add_tenant
repeat_add = 'y'
  while repeat_add == 'y'
    puts
    puts "New Tenant:"
    print "Name: "
    new_tenant_name = gets.chomp
    print "Age: "
    new_tenant_age = gets.chomp.to_i
    # add gender as a symbol. how to make this loop back?
    print "Gender - 'm' or 'f': "
    new_tenant_gender = gets.chomp
      if new_tenant_gender != 'm' || new_tenant_gender != 'f'
        puts "Please select 'm' or 'f': "
      else
        new_tenant_gender.to_sym
      end

    new_tenant_object = Tenant.new(new_tenant_name, new_tenant_age, new_tenant_gender)
    $all_tenants << new_tenant_object

    puts "-" * 30
    puts "Saved new tenant: #{new_tenant_object}"
# repeat this method or return to start_menu
    puts "Would you like to add another tenant, 'y' or 'n'? "
    repeat_add = gets.chomp.downcase
    if repeat_add == 'n'
      puts
      start_menu
    end
  end
end

# Method for adding a new building
def add_building
repeat_add = 'y'
  while repeat_add == 'y'
    puts
    puts "New Building:"
    print "Address: "
    new_building_name = gets.chomp
    print "Style - 'modern', 'gothic', 'farmhouse', 'ranch': "
    new_building_style = gets.chomp.to_sym
    # set boolean
    print "Doorman - 'y' or 'n': "
    new_building_doorman = gets.chomp
      if new_building_doorman == 'y'
        new_building_doorman = true
      else
        new_building_doorman = false
      end
    # set boolean
    print "Elevator - 'y' or 'n: "
    new_building_elevator = gets.chomp
      if new_building_elevator == 'y'
        new_building_elevator = true
      else
        new_building_elevator = false
      end
    print "Floors: "
    new_building_floors = gets.chomp.to_i
# create object from user input and pass to the storage array
    new_building_object = Building.new(new_building_name, new_building_style, new_building_doorman, new_building_elevator, new_building_floors)
    $all_buildings << new_building_object

    puts "-" * 30
    puts "Saved new building: #{new_building_object}"
# repeat this method or return to start_menu
    puts "Would you like to add another building, 'y' or 'n'? "
    repeat_add = gets.chomp.downcase
    if repeat_add == 'n'
      puts
      start_menu
    end
  end
end

def add_apartment
  repeat_add = 'y'
  while repeat_add == 'y'
    puts
    puts "New Apartment:"
    print "Square ft: "
    new_apartment_sqft = gets.chomp.to_i
    print "No. of Bedrooms: "
    new_apartment_rooms = gets.chomp.to_i
    print "No. of Bathrooms: "
    new_apartment_baths =  gets.chomp.to_i

    new_apartment_object = Apartment.new(new_apartment_sqft, new_apartment_rooms, new_apartment_baths)
    $all_apartments << new_apartment_object

    puts "-" * 30
    puts "Saved new apartment: #{new_apartment_object}"
# repeat this method or return to start_menu
    puts "Would you like to add another apartment, 'y' or 'n'? "
    repeat_add = gets.chomp.downcase
    if repeat_add == 'n'
      puts
      start_menu
    end
  end
end

###############################################
# PRINT ALL ARRAYS
###############################################

def view_all_buildings
  puts
  puts "Current buildings:"
  puts $all_buildings
  # add options to sort by x
  puts "Return to the main menu (mm) or enter sort menu (sm)? "
  choice = gets.chomp
    if choice == 'mm'
      start_menu
    else
      buildings_sort_menu
  end
end
def view_all_apartments
  puts
  puts "Current Apartments: "
  puts $all_apartments

  start_menu
end

def view_all_tenants
  puts
  puts "Current Tenants:"
  puts $all_tenants

  start_menu
end

###############################################
# BUILDING SORT MENU
###############################################

def buildings_sort_menu
  sort = $all_buildings[2]
  puts sort
end
# calls the program

start_menu

#called start_menu a million times :/
#how to add a specific tenant to a specific appartment?
#how to add a specific apartment to a building?
#should have used a hash for storage and even each a key






