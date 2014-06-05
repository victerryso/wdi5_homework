class Apartment
  attr_accessor :price, :sqft, :num_bathrooms, :num_bedrooms, :occupants

  def initialize(sqft, num_bedrooms, num_bathrooms)
    @price = 0
    @sqft = sqft
    @num_bathrooms = num_bathrooms
    @num_bedrooms = num_bedrooms
    @occupants = []
  end

    def to_s
      "Sq.ft: #{@sqft} No.beds: #{num_bedrooms} No.baths: #{num_bathrooms} and #{@occupants.length} occupants"
    end

    def occupied?
      @occupants.any?
    end
end
