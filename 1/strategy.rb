class Strategy
  def use
  end
end

class StrategyOne < Strategy
  def use
    puts "Strategy one"
  end
end

class StrategyTwo < Strategy
  def use
    puts "Strategy two"
  end
end

class StrategyThree < Strategy
  def use
    puts "Strategy three"
  end
end

class Context
  attr_accessor :strategy

  def initialize strategy
    @strategy = strategy
  end

  def useStrategy
    strategy.use
  end
end
 
context = Context.new StrategyOne.new
context.useStrategy
 
context.strategy = StrategyTwo.new
context.useStrategy
 
context.strategy = StrategyThree.new
context.useStrategy