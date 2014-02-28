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

5.times do |i|
  car = Car.new(i, i % 2 == 0 ? 'kalina' : 'granta')
  car.draw  
end