# require 'pry-debugger'

require_relative 'building.rb'
require_relative 'apartment.rb'
require_relative 'tenant.rb'

binding.pry

def ask(question)
   puts question
   gets.chomp
end

def list
   puts "What do you want to check? (b)uilding, (a)partments or (t)enants?"
end

# answer = ask('some question')

#  gets chomp crap

# def add_building
#    puts "You want to list a new building."

#    address = ask("What is the address of the building")
#    style = ask("What style is the building")
#    has_doorman = ask("Does your building have a doorman?")
#    has_elevator = ask("Does you building have an elevator?")
#    num_floors = ask("How man floors does your building have?")
# end

# def add_apartment
#    puts "You want to list a new apartment."

#    sqrft = ask("How big is your apartment in square feet?")
#    num_bedrooms = ask("How many bedrooms does it have?")
#    num_bathrooms = ask("How many bathrooms does it have?")
# end


# seed data
b1 = Building.new(ask('Street Address?'), ask('Square feet?'), ask('Doorman present?'), ask('Elevator present?'),ask('Number of floors?'))
a1 = Apartment.new(ask('Area of the apartment? (Square feet)'), ask('How many bedrooms?'), ask('How many bathrooms?'))
t1 = Tenant.new(ask('Name?'),)
# t2 =  Tenant.new()