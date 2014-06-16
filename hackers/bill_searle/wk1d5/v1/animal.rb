class Animal
  attr_accessor :name, :age, :gender, :species, :toy

  def initialize(name, age, gender, species, toy)
    @name = name
    @age = age
    @gender = gender
    @species = species
    @toys = []
  end

  def to_s
    "#{@name}, #{age}, #{gender}, #{species}, #{toy}"
  end
end
