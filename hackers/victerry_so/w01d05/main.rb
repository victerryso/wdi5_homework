require "pry"
require "pry-debugger"
require "csv"
require_relative "animal.rb"
require_relative "client.rb"

a_list = {}
c_list = {} # List of clients

# a_list = CSV.read("a_list.csv") # Turns into arrays, not hashes

def a_add # Assigning the Animal class with attributes
  print "Name: "; name = gets.chomp.to_s
  print "Age: "; age = gets.chomp.to_i
  print "Gender: "; gender = gets.chomp.to_s
  print "Species: "; species = gets.chomp.to_s
  Animal.new(name, age, gender, species)
end

def c_add # Assigning the Client class with attributes
  print "Name: "; name = gets.chomp.to_s
  print "Children: "; children = gets.chomp.to_i
  print "Age: "; age = gets.chomp.to_i
  Client.new(name, children, age)
end


input = nil

until input == "quit" # Menu Loop
  puts "\n\nWelcome to Happitails"
  puts "1 - Display animals"
  puts "2 - Add an animal"
  puts "3 - Add a toy to an animal"
  puts "4 - Display clients"
  puts "5 - Add a client"
  puts "6 - Adopting a pet"
  puts "7 - Unadopting a pet"
  print  "> "
  input = gets.chomp.to_s
  puts ""

  case input

  when "1" # List of animals √
    puts "\nHappy Animals\n"
    puts a_list.values.select { |x| x.adopted } # Listing animals where adopted = true
    puts "\nLonely Animals\n"
    puts a_list.values.reject { |x| x.adopted } # Listing animals where adopted = false

  when "2" # Adding animals √
    add = a_add
    if a_list.has_key?(add.name) # Checking if animal exist
        puts "#{add.name} already exist."
    else
        a_list[add.name] = add
        puts "#{add.name} has been added."
    end

  when "3" # Adding toys to animals √
    print "Animal name: "; a_name = gets.chomp.to_s # Getting animal name
    if a_list.has_key?(a_name) # Checking if animal exist
      print "Toys: "; a_toy = gets.chomp.to_s # Getting toy name
      a_list[a_list[a_name].toys << a_toy] # Adding toy to animal's toy array
      puts "#{a_toy} has been added to #{a_name}."
    else
      puts "Animal not found."
    end

  when "4" # List of clients √
    puts c_list.values

  when "5" # Adding clients √
    add = c_add
    if c_list.has_key?(add.name) # Checking if animal exist
        puts "#{add.name} already exist."
    else
        c_list[add.name] = add
        puts "#{add.name} has been added."
    end

  when "6" # Adding pets to clients √
    print "Client name: "; c_name = gets.chomp.to_s # Getting client name
    if c_list.has_key?(c_name) # Checking if client exist
      print "Animal name: "; a_name = gets.chomp.to_s # Getting animal name
      if a_list.has_key?(a_name) # Checking if animal exist
        c_list[c_list[c_name].pets << a_name] # Adding animal to client's pet array
        a_list[a_name].adopted = true # Marking animal as happy
        puts "#{a_name} has been added to #{c_name}."
      else
      puts "Animal not found."
    end
  else
    puts "Client not found."
  end

  when "7" # Removing pets from clients √
    print "Client name: "; c_name = gets.chomp.to_s # Getting client name
    if c_list.has_key?(c_name) # Checking if client exist
      print "Animal name: "; a_name = gets.chomp.to_s # Getting animal name
      if a_list.has_key?(a_name) && c_list[c_name].pets.include?(a_name) # Checking if animal exist + if client has adopted the animal
        c_list[c_list[c_name].pets.delete(a_name)] # Deleting animal from the client's pet array
        a_list[a_name].adopted = false # Marking animal as lonely
        puts "#{a_name} has been removed from #{c_name}."
      else
        puts "Animal not found."
      end
    else
      puts "Client not found."
    end

  end

  #CSV.open("a_list.csv", "wb") { |csv| csv = [a_list] }

end