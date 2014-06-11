require 'pry'
require 'pry-debugger'

require_relative 'apartment.rb'
require_relative 'building.rb'
require_relative 'tenant.rb'
require_relative 'menu.rb'

$buildings = []
$apartments = []
$tenants = []

### FORMATTING ###

# buildings << b

def boolean_transform(x)
  if x == "t"
    x = "true"
  else 
    x = "false"
    ### CODE TO CATCH INVALID INPUT? ###
  end
end

def menu_instructions
  puts "Select NUMBER to access submenu\nType 'T' for TRUE and 'F' for FALSE\n\n"
end

def menu_rq_access
  puts "\nR. Root Menu\nQ. Quit\n\n"
  case menu_choice
    when "r" then root_menu
    when "q" then quit
  end
end

def choice_transform
  gets.chomp.downcase
end

def quit
  puts "Are you sure you want to quit? (Y/N)"
  quit_confirm = choice_transform
  if quit_confirm == "y"
    puts `clear`
    Process.exit
  else root_menu
  end
end

##########################
#### ADDING MECHANISM ####
##########################

## ---- BUILDING ADD ---- ##
  def add_building_tool
    puts`clear`
    puts "ADD NEW BUILDING"
    print "Address: "
    address = choice_transform.to_s
    print "Building style: "
    style = choice_transform.to_sym
    print "Has doorman (T/F): "
    has_doorman = choice_transform #boolean_transform 
    print "Has elevator (T/F): "
    has_elevator = choice_transform #boolean_transform
    print "Number of floors: "
    num_floors = choice_transform.to_i

    b = Building.new(address, style, has_doorman, has_elevator, num_floors)

    $building << b
  end

## ---- APARTMENT ADD ---- ##

  def add_apartment_tool
    puts`clear`
    puts "ADD NEW APARTMENT"
    print "Size (sq. ft): "
    sq_ft = choice_transform.to_i
    print "Number of bedrooms: "
    num_bed = choice_transform.to_i
    print "Number of bathrooms: "
    num_bath = choice_transform.to_i

    a = Apartment.new(sq_ft, num_bed, num_bath)

    $apartments << a

    puts "would you like to do anything else?"
    root_menu
    menu_rq_access

  end

## ---- TENANTS ADD ---- ##

  def add_tenant_tool
    puts`clear`
    puts "ADD NEW TENANT"
    print "Name: "
    name = choice_transform.to_s
    print "Age: "
    age = choice_transform.to_i
    print "Gender: "
    gender = choice_transform.to_sym

    t = Tenant.new(name, age, gender)

    $tenants << t

    puts "You have successfully added a new tenant:"
    puts "Name: #{name}"
    puts "Age: #{age}"
    puts "Gender: #{gender}"
    puts "Would you like to do anything else?\n"
    menu_instructions
  end
#################################
#### LIST AND SORT MECHANISM ####
#################################

def list_buildings
  puts`clear`
  puts "LIST BUILDINGS"
  $apartments.each do |x|
    x.each |x
  }
  end
end

def list_apartments
  
end

def list_occupants
  
end

def sort_buildings
end

def sort_apartments
  
end

def sort_occupants
  
end

### PROGRAM STARTS HERE ###

root_menu

### SEED DATA: TENANT LIST ###

  t1 = Tenant.new('Jackie Olson', 22, :female)
  t2 = Tenant.new('Laura Karovski', 45, :female)
  t3 = Tenant.new('Kate Spade', 30, :male)
  t4 = Tenant.new('Ralph Lauren', 66, :male)

### SEED DATA: APARTMENT LIST ###

  a1 = Apartment.new(1000, 2, 2)
  a2 = Apartment.new(750, 1, 1)
  a3 = Apartment.new(1500, 2, 3)
  a4 = Apartment.new(1500, 2, 3)
  a5 = Apartment.new(1500, 2, 3)
  a6 = Apartment.new(1500, 2, 3)

  $apartments = [a1, a2, a3, a4, a5, a6]

### SEED DATA: BUILDING LIST ###

  b1 = Building.new('100 Main St.', :Victorian, true, false, 3)
  b2 = Building.new('2015 East Ave.', :Gothic, true, true, 8)
  b3 = Building.new('1111 Pine St.', :Victorian, false, false, 6)

binding.pry