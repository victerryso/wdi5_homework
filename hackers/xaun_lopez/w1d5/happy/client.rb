class Client
  attr_accessor :name, :num_children, :age, :pets_from_shelter, :disowned_pets
  def initialize(first_name, last_name, num_children, age)
    @first_name = first_name
    @last_name = last_name
    @num_children = num_children
    @age = age
    @pets_from_shelter = []
    @disowned_pets = []
  end

  def to_s
    "#{@first_name} #{@last_name}, #{@age} years old, has #{@num_children} children. #{@first_name} has adopted #{@pets_from_shelter.length} pet(s) from Happitails, and put up #{@disowned_pets.length} pet(s) for adoption with Happitails."
  end

end
