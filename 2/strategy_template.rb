class Strategy
  def compare
  end
end

class StrategyDiv2 < Strategy
  def compare a, b
    (a % 2 > b % 2)
  end
end

class StrategyDiv3 < Strategy
  def compare a, b
    (a % 3 > b % 3)
  end
end

class StrategyReverse < Strategy
  def compare a, b
    (a > b)
  end
end

class Sorter
  attr_accessor :strategy
  def sort
    array = (0..10).to_a
    array.length.times do |i|
      array.length.times do |j|
        if @strategy.compare array[i], array[j]
          temp = array[i]
          array[i] = array[j]
          array[j] = temp
        end
      end
    end
    p array
  end
end

a = 1
b = 2