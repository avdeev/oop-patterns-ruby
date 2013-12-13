class Abstraction
  attr_accessor :implementor
  def operation
    @implementor.operation();
  end
end

class Implementor
  def operation
  end
end

class RefinedAbstraction < Abstraction
  def operation()
    @implementor.operation()
  end
end

class ConcreteImplementorA < Implementor
  def operation
    puts "ConcreteImplementorA operation"
  end
end

class ConcreteImplementorB < Implementor
  def operation
    puts "ConcreteImplementorB operation"
  end
end

ab = RefinedAbstraction.new

ab.implementor = Implementor.new 
ab.operation()

ab.implementor = ConcreteImplementorB.new
ab.operation()