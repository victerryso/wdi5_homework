class Client
  attr_accessor :name, :age, :num_children, :num_pets, :pets_list
  def initialize(name, age, num_children, num_pets, pets_list)
    @name = name
    @age = age
    @num_children = num_children
    @num_pets = num_pets
    @pets_list = []
  end
end