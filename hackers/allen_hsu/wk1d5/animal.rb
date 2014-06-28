class Animal
  attr_accessor :name, :species, :age, :gender, :weight, :color, :was_neutered, :toy, :description
  def initialize(name = nil, species = nil, age = nil, gender = nil, weight = nil, color = nil, was_neutered = nil, toy = nil, description = nil)
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

  def to_s
    "#{species} \t #{name}"
  end
end