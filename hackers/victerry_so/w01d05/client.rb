class Client
  attr_accessor :name, :children, :age, :pets

  def initialize(name, children, age)
    @name = name
    @children = children
    @age = age
    @pets = []
  end

  def to_s
    "\nName: #{name}\nChildren: #{children}\nAge: #{age}\nPets: #{pets}"
  end

end