class Apartment
  attr_accessor :price, :sq_ft, :num_bed, :num_bath, :occupants

  def initialize(sq_ft, num_bed, num_bath)
    @price = 0
    @num_bed = num_bed
    @num_bath = num_bath
    @occupants = []
  end

  def to_s
    "The apartment is #{@sq_ft} and has #{@occupants.length} occupants."
  end

  def occupied?
    @occupants.any? #Will return true if there is at least one document and false otherwise.
  end
  
end
