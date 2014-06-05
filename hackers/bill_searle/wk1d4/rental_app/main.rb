require 'pry'
require 'pry-debugger'

require_relative 'apartment'
require_relative 'building'
require_relative 'tenant'

# binding.pry

# Storage arrays
$all_tenants = []
all_buildings = []
all_apartments = []

# Seed data
# Building
all_buildings << b1 = Building.new('240 Frost Street', :Modern, false, true, 5)
all_buildings << b2 = Building.new('18 Old Street', :Gothic, false, false, 2)

# Apartment
all_apartments << a1 = Apartment.new(1500, 2, 1)
all_apartments << a2 = Apartment.new(800, 1, 1)
all_apartments << a3 = Apartment.new(5000, 3, 2)
all_apartments << a4 = Apartment.new(3500, 2, 2)

# Tenant
$all_tenants << t1 = Tenant.new('Bill', 27, :male)
$all_tenants << t2 = Tenant.new('Rose', 24, :female)
$all_tenants << t3 = Tenant.new('Amy', 25, :female)
$all_tenants << t4 = Tenant.new('Tom', 35, :male)

# def the start menu
def start_menu
  puts "Please select from the follow options:"
  puts "Add a  (t)enant,"
  puts "Add a  (b)uilding,"
  puts "Add an (a)partment"
  puts "(Q)uit"

  menu_choice = gets.chomp.downcase

  if menu_choice == 't'
    add_tenant
  elsif menu_choice == 'b'
    add_building
  elsif menu_choice == 'a'
    add_apartment
  elsif menu_choice == 'q'
    puts "SEE YA!"
    Kernel.exit
  else
    puts "Unknown option, restarting."
    start_menu
  end
end

def add_tenant
repeat_add = 'y'
  while repeat_add == 'y'
    puts "Add a new tenant below,"
    print "Name: "
    new_tenant_name = gets.chomp
    print "Age: "
    new_tenant_age = gets.chomp.to_i
    print "Gender: "
    new_tenant_gender = gets.chomp.to_sym

    new_tenant_object = Tenant.new(new_tenant_name, new_tenant_age, new_tenant_gender)

    $all_tenants << new_tenant_object
    puts $all_tenants

    puts "Would you like to add another tenant, 'y' or 'n'? "
    repeat_add = gets.chomp.downcase
    if repeat_add == 'n'
      start_menu
    end
  end
end

hello

# calls the program
start_menu






