class Animal
  attr_accessor :animal_name, :animal_age, :animal_gender, :animal_species, :animal_toy

  def initialize(animal_name, animal_style, animal_gender, animal_species, toys)
    @name = animal_name
    @age = animal_age
    @gender = animal_gender
    @species = animal_species
    @toys = []
  end

  def to_s
    "#{@name} the #{@species} is #{@age} and has #{@toys} toys"
  end

    def toys
    @toys.any?
  end
end
