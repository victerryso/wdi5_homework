class Apartment
  attr_accessor :price, :sqft, :num_beds, :num_bathrooms, :occupants

  def initialize(sqft, num_beds, num_bathrooms)
    @price = price
    @sqft = sqft
    @num_beds = num_beds
    @num_bathrooms = num_bathrooms
    @occupants = []
  end

  # def to_s
  #   "The apartment is #{@sqft} square feet and has #{occupants.length} occupants"
  # end

  def occupied?
    @occupants.any?
  end
end
