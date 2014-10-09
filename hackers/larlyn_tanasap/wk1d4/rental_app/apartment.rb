class Apartment
   attr_accessor :price, :sqft, :num_bedrooms, :num_bathrooms, :occupants

   def initialize(sqft=0, num_bedrooms=0, num_bathrooms=0)
      @price = 0
      @sqft = sqft
      @num_bedrooms = @num_bedrooms
      @num_bathrooms = @num_bathrooms
      @occupants = []
   end

   def to_s
      "The apartment is #{ @sqft } square feet, and has #{ @occupants.length } occupants."
   end

   def occupied?
      @occupants.any?
   end


end