# Flyweight
class Car
  attr_accessor :number, :model
  def initialize number, model
    @number = number
    @model = model
  end
  def draw
    p "Car: #{self.object_id}, #{number}, #{model}"
  end
end

# Flyweight Factory
class CarFactory
  attr_accessor :cars
  def initialize
    @cars = {}
  end
  def get_car number, model
    @cars[model] ||= Car.new(number, model)
    @cars[model].number = number
    @cars[model]
  end
end

factory = CarFactory.new

5.times do |i|
  car = factory.get_car(i, i % 2 == 0 ? 'kalina' : 'granta')
  car.draw  
end