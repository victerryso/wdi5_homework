class Animal
   attr_accessor :species, :name, :age, :gender, :toys
   def initialize(species,name,age,gender)
      @species = species
      @name = name
      @age = age
      @gender = gender
      @toys = []
   end

   def to_s
      puts "#{name} is a #{ age } year old #{ gender.to_s } #{ species.to_s }."
      unless toys.empty?
         puts "\t#{name} has the toys: #{ toys.join ", "}."
      end
   end
end
