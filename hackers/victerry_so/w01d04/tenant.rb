class Tenant
  attr_accessor :name, :age, :gender

  def initialize(nom, age, gender)
    @nom = nom
    @age = age
    @gender = gender
  end

  def to_s
    "#{@name} is a #{@age} year old #{@gender}."
  end
end