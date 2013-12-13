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

class GroupStrategy < Strategy
  attr_accessor :strategy_list
  def initialize
    @strategy_list = []
  end
  def addStrategy strategy
    @strategy_list << strategy
  end

  def compare a, b
    a_counter = 0
    b_counter = 0
    @strategy_list.each do |strategy|
      if strategy.compare a, b
        a_counter = a_counter + 1
      else
        b_counter = b_counter + 1
      end
    end
    (a_counter > b_counter)
  end

end

class Sorter
  attr_accessor :strategy

  def initialize strategy
    @strategy = strategy
  end

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
 
sorter = Sorter.new StrategyDiv2.new
sorter.sort()
 
sorter.strategy = StrategyDiv3.new
sorter.sort()
 
sorter.strategy = StrategyReverse.new
sorter.sort()

group = GroupStrategy.new
group.addStrategy StrategyDiv2.new
group.addStrategy StrategyDiv3.new
group.addStrategy StrategyReverse.new
sorter.strategy = group
sorter.sort()