class Client
  attr_accessor :name, :num_of_children, :age, :num_of_pets

  def initialize(name, num_of_children, age, num_of_pets)
    @name = client_name
    @num_of_children = num_of_children
    @age = client_age
    @num_of_pets = num_of_pets
  end

  def to_s
    "#{@name} is #{@age}, has #{@num_of_children} children and #{num_of_pets} pets."
  end

   def num_of_pets
    @num_of_pets.any?
  end
end
