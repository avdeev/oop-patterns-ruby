class Strategy
  def compare
    raise NotImplementedError
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
    # p array
  end
end

class DecoratorReverse
  attr_accessor :component
  def initialize component
    @component = component
  end

  def compare a, b
    not @component.compare a, b
  end
end

class DecoratorCache
  attr_accessor :cache, :component
  def initialize component
    @cache = Hash.new
    @component = component
  end

  def compare a, b
    if @cache[[a, b]]
      @cache[[a, b]]
    else
      @cache[[a, b]] = @component.compare a, b
      @cache[[a, b]]
    end
  end
end

sorter = Sorter.new

sorter.strategy = StrategyReverse.new
sorter.sort()

sorter.strategy = DecoratorCache.new sorter.strategy
sorter.sort()

p sorter.strategy.cache