class Car
  # STATE AND BEHAVIOR
  def initialize(brand, color)
    @brand = brand
    @color = color
    @fuel = 0
  end

  def fuel_the_car
    @fuel = 100
  end
end

audi = Car.new("Audi", "White")
