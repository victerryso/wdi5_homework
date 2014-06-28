class Client
  attr_accessor :username, :name, :age, :num_of_children, :num_of_pets, :pets
  def initialize(username, name, age, num_of_children, num_of_pets, pets)
    @username = username
    @name = name
    @age = age
    @num_of_children = num_of_children
    @num_of_pets = num_of_pets
    @pets = pets
  end
end

