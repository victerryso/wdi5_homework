class Animal
  attr_accessor :name, :species, :age, :gender, :weight, :color, :was_neutered, :toy, :description
  def initialize(name, species, age, gender, weight, color, was_neutered, toy, description)
    @name = name
    @species = species
    @age = age
    @gender = gender
    @weight = weight
    @color = color
    @was_neutered = was_neutered
    @toy = toy
    @description = description
  end

end