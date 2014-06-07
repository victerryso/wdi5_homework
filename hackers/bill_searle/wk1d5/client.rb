class Client
  attr_accessor :name, :num_children, :age, :num_pets

  def initialize(name, num_children, age, num_pets)
    @name = name
    @num_children = num_children
    @age = age
    @num_pets = num_pets
  end

  def to_s
    "Name: #{@name}, No.Children: #{num_children}, Age: #{age}, No.Pets: #{num_pets}"
  end
end
