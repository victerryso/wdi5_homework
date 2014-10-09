
require 'pry'
require 'pry-debugger'

require_relative 'apartment'
require_relative 'building'
require_relative 'tenant'

$tenants = []

def list
t1 = Tenant.new("David Mesaros",28,"Male")
t2 = Tenant.new("Frances Bord", 30, "Female")
a1 = Apartment.new(98, 4, 2 )
b1 = Building.new("Geaorge Street","","","","")
p "#{t1}"
p "#{t2}"
end

def menu
  puts " Data base for rental"
  puts "(t)entants , (q)uit"
  puts = gets.chomp
    
end

def directory
  response = menu
     if response == 't'
     puts "You have selected tenants"
     tenants_menu
     else response == 'q'
      puts "Quitting"
      Kernel.exit
       
     end
   end
      
  def tenants_menu
  puts "************************"
  puts "     Tenant Manager     "
  puts "************************"
  puts "(a)dd or (l)ist all"
  tenant_response = gets.chomp
      case tenant_response
      when 'a'
      puts "You have selcect add tenats"
      add_tenants
      when 'l'
      puts " You have selected list"
      puts " Currently  you have the following"
      list
      end

  end

 def add_tenants
  puts "What is the Tenants name?"
  name = gets.chomp
  puts "What is your Tenants age?"
  age = gets.chomp

  puts  "what is Tenants gender?"
  gender = gets.chomp

  tenants = Tenant.new(name, age, gender)
  $tenants << tenants
  binding.pry

end



while true
  director
  puts "======="
end


# d = t1.name 
# c = a1.sqft
# e = b1.address



# x = t1 # list of my local variables for tenant
# y = t2 # list of my local variables for tenant

# p "#{d} live #{c}"


    #    if tenants_list == 't'
    #     puts " We have the following tenants"
    #     puts "#{t1.name} of #{b1.address}"
    #   else tenants_list == 'a'
    #     puts "plese enter name"
    #     name_2 = gets.chomp
    #     puts "Please enter street address"
    #     add_2 = gets.chomp
    #     puts " You now have the following tenants on file"
    #     puts "#{t1.name} of #{b1}" 
    #     puts "#{name_2} of #{add_2}"
    #   end
    # end


# def menu
#   puts " Data base for rental"
#   puts "(t)entants , (a)partments, (b)uildings"
#   options = gets.chomp
    
# end

# tenants = menu
#  if tenants == 't'
#      puts "Welcome, would you like to see your list of (t)enants or (a)dd a tenent? "
#        tenants_list = gets.chomp
#        if tenants_list == 't'
#         puts " We have the following tenants"
#         puts "#{t1.name} of #{b1.address}"
#       else tenants_list == 'a'
#         puts "plese enter name"
#         name_2 = gets.chomp
#         puts "Please enter street address"
#         add_2 = gets.chomp
#         puts " You now have the following tenants on file"
#         puts "#{t1.name} of #{b1}" 
#         puts "#{name_2} of #{add_2}"
#       end
#     end

# def tenants
  
#   puts "Welcome, would you like to see your list of (t)enants or (a)dd an tenent? "
#     tenants_list = gets.chomp
#     if 

# end
# tenents



#  p t1.name
#  p b1.address
#  p t1.age

#  p a1.sqft
# binding.pry


# puts "Welcome, would you like to see your list of (t)enants (a)partments or (q)uit "
# menu = gets.chomp.downcase

#  if menu == 't'
#     puts " We have the following tenants #{t1.name} and #{t2.name}"
#     puts "#{x}"
#     puts "#{y}"
#  else menu == 'q'
#   	puts "Quitting"
#   	Kernel.exit
# end
# def rental
  
#    puts "Welcome, would you like to see your list of (t)enants, (a)partments, (b)uilding,  (q)uit "
   
# end

# rental = i

# i.each do |x|
#   x =  puts  "Welcome, would you like to see your list of (t)enants, (a)partments, (b)uilding,  (q)uit "
# end



# menu = gets.chomp.downcase
# case menu 
# when 't'
#     puts " We have the following tenants #{t1.name} and #{t2.name}"
#     puts "#{t1} resides at #{e}"
#     puts " "
#     puts "#{t2}"
   
    
# when 'a' 
# 	puts " We have the following apartment for avaialbe for rent"
#   puts "#{e}"
# 	puts "#{a1}"

# when 'b'
# 	puts "The detail of the building"
# 	puts "#{b1}" 

    
# when 'q'
#   	puts "Quitting"
#   	Kernel.exit
#  end















 






