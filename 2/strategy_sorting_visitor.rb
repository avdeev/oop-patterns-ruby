class Strategy
  def compare
  end
  def accept visitor
    visitor.visit self
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

class Visitor
  def visit
  end
end

class VisitorCounter < Visitor
  attr_accessor :count, :list

  def initialize
    @count = 0
    @list = []
  end

  def visit strategy
    @count += 1
    @list << strategy.class.to_s
  end
end

class VisitorSorter < Visitor
  def visit strategy
    sorter = Sorter.new
    sorter.strategy = strategy
    sorter.sort
  end
end
 
visitorCounter = VisitorCounter.new
comparatorDiv3 = StrategyDiv3.new
comparatorDiv2 = StrategyDiv2.new
comparatorReverse = StrategyReverse.new

comparatorDiv3.accept(visitorCounter)
comparatorDiv2.accept(visitorCounter)
comparatorReverse.accept(visitorCounter)

p visitorCounter.count, visitorCounter.list

visitorSorter = VisitorSorter.new

comparatorDiv3.accept(visitorSorter)
comparatorDiv2.accept(visitorSorter)
comparatorReverse.accept(visitorSorter)