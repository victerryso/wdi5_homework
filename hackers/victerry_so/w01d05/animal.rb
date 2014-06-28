class Animal
  attr_accessor :name, :age, :gender, :species, :toys, :adopted

  def initialize(name, age, gender, species)
    @name = name
    @age = age
    @gender = gender
    @species = species
    @toys = []
    @adopted = false
  end

  def to_s
    "\nName: #{name}\nAge: #{age}\nGender: #{gender}\nSpecies: #{species}\nToys: #{toys}"
  end

end