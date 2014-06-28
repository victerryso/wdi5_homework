class Apartment
  attr_accessor :price, :sqft, :num_bathrooms, :num_bathrooms, :num_bathrooms, :occupants

  def initialize(value, sqft, num_bedrooms, num_bathrooms)
    @value = value
    @sqft = sqft
    @num_bedrooms = num_bedrooms
    @num_bathrooms = num_bathrooms
    @occupants = []
  end

  def to_s
    "Valued at $#{ @value }, for #{ @sqft } square feet and has #{ @occupants.length } occupants"
  end

  def occupied?
    @occupants.any?
  end
end



