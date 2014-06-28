class Animal
  attr_accessor :name, :age, :gender, :species, :comment, :toys

  def initialize(name, age, gender, species, toys=nil, comment=:Available )
    @name = name
    @age = age
    @gender = gender
    @species = species
    @toys = []
    @comment = comment

  end

  def info
    " [Name] #{ @name }   [Age] #{ @age } years old   [Gender] #{ @gender }   [Species] #{ @species }    [Toys] #{ @toys.length }    [Adoption] #{ @comment } "
  end


end