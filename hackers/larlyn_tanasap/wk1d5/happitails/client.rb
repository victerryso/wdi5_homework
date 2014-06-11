class Client
   attr_accessor :name, :kids, :age, :client_pets, :username
   def initialize(username, name, kids, age)
      @username = username
      @name = name
      @kids = kids
      @age = age
      @client_pets = []
   end

   def to_s
      puts "#{ name } is #{ age } years old, has #{ kids } kid(s)."
      unless client_pets.empty?
         puts "#{ name } has these pets from Happitails:"
         client_pets.each {|pet| pet.to_s }
      end
      puts
   end

end


