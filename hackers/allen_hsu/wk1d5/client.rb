class Client
  attr_accessor :name, :num_of_children, :age, :array
  def initialize(name = nil, num_of_children = nil, age = nil, array = nil)
    @name = name
    @num_of_children = num_of_children
    @age = age
    @array = array
  end

  def to_s
    "#{@name}"
  end
end
