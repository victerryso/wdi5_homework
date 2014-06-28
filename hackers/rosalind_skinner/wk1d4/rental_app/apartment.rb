class Apartment
  attr_accessor :price, :sqft, :num_bathrooms, :num_bedrooms, :occupants

  def initialize(price, sqft, num_bedrooms, num_bathrooms)
    @price = 0
    @sqft = sqft
    @num_bathrooms = num_bathrooms
    @num_bedrooms = num_bedrooms
    @occupants = []
  end

  def to_s
    "The apartment is #{@sqft} square feet and has #{@occupants.length} occupants"
  end

  def occupied?
    @occupants.any? #return if true. check if anyone is in the apartment
  end
end
