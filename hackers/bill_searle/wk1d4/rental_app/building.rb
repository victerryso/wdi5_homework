class Building
  attr_accessor :address, :style, :has_doorman, :has_elevator, :num_floors, :apartments

  def initialize(address, style, has_doorman, has_elevator, num_floors)
    @address = address
    @style = style
    @has_doorman = has_doorman
    @has_elevator = has_doorman
    @num_floors = num_floors
    @apartments = {}
  end

  def to_s
    "Style: #{@style}  Address: #{@address}  Floors :#{@num_floors} Apts: #{@apartments.length}."
  end
end