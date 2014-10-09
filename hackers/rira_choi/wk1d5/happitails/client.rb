class Client
  attr_accessor :name, :num_children, :age, :pets

  def initialize(name, num_children, age, pets=nil)
    @name = name
    @num_children = num_children
    @age = age
    @pets = [] #Integer/ from animal class

  end

  def info
    " [Name] #{ @name }   [Age] #{ @age } years old    [Children] #{ @num_children }   [pets] #{ @pets.length }"
  end

  def pets_names
    var1 = ""
    @pets.each do | name |
      var1 += "#{ name }, "
    end
   " The Client[ #{ @name } ] has #{ var1 } "
  end

end
