class Shelter
  attr_accessor :client_animals, :avial_animals

  def initialize(client_animals, avial_animals, animals)
    @client_animals = []
    @avial_animals = []
    @animals = []

  end

  def to_s
    "Animals: #{animals}."
  end
end
