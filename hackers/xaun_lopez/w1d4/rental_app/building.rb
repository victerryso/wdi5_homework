class Building
  attr_accessor :address, :style, :has_doorman, :has_evelator, :num_floors, :apartments

  def initialize(address, style, has_doorman, has_evelator, num_floors)
    @address = address
    @style = style
    @has_doorman = has_doorman
    @has_evelator = has_evelator
    @num_floors = num_floors
    @apartments = {}
  end

  def to_s
    "The #{ @style } building at #{ @address } has #{ @apartments.length } apartments and #{ @num_floors } floors"
  end

end

