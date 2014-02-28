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

class CarFactory
  attr_accessor :cars
  def initialize
    @cars = {}
  end
  def getCar number, model
    if @cars[model] != nil
      @cars[model]
    else
      @cars[model] = Car.new number, model
      @cars[model]
    end
  end
end

carFactory = CarFactory.new

5.times do |i|
  car = carFactory.getCar(i, i % 2 == 0 ? 'kalina' : 'granta')
  car.draw  
end