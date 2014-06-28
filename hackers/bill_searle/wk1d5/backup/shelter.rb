class Shelter
attr_accessor :animals, :clients

  def initialize(name)
    @name = name
    # @animals = []
    # @clients = []
  end

  def to_s
    "#{@name}"
  end
end


