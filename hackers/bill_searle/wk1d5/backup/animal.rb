class Animal
  attr_accessor :name, :age, :gender, :species, :toy

  def initialize(name, age, gender, species, toy)
    @name = name
    @age = age
    @gender = gender
    @species = species
    @toy = []
  end

  def to_s
    "Name: #{@name}, Age: #{age}, Gender: #{gender}, Species: #{species}, Toys: #{toy}"
  end
end
