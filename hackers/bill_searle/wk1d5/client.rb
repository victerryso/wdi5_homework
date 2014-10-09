class Client
  attr_accessor :name, :num_children, :age, :pets

  def initialize(name, num_children, age, pets)
    @name = name
    @num_children = num_children
    @age = age
    @pets = []
  end

  def to_s
    "Name: #{@name}, No.Children: #{num_children}, Age: #{age}, Pets: #{pets.to_s}"
  end
end
