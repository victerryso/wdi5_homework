class Robot
  attr_accessor :name, :array

  @@array = []

  def initialize

  end

  def name
    @name = ("A".."Z").to_a.sample(2).join + ("0".."9").to_a.sample(3).join
    while @@array.include? @name
      reset
    end
    @@array << @name
    #(0..1).map { ('A'..'Z').to_a[rand(26)] }.join + (2..4).map {rand(10)}.join
  end

  def reset
    @name = ("A".."Z").to_a.sample(2).join + ("0".."9").to_a.sample(3).join
  end


end

p ["A".."Z"]
p robot1 = Robot.new
p robot1.name
p robot2 = Robot.new