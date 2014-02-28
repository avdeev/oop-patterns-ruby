# Flyweight Object
class Lamp
  def initialize(color)
    @color = color
  end
  def get_color
    @color
  end
end
 
class TreeBranch
  def initialize(branch_number)
    @branch_number = branch_number
  end
  def hang(lamp)
    p "Hang #{lamp.get_color} lamp on branch #{@branch_number}"
  end
end
 
# Flyweight Factory
class LampFactory
  def initialize
    @lamps = {}
  end
  def get_lamp(color)
    if @lamps.has_key?(color)
      # if the lamp already exists, reference it instead of creating a new one
      lamp = @lamps[color]
    else
      lamp = Lamp.new(color)
      @lamps[color] = lamp
    end
    lamp
  end
  def get_total_lamps_made
    @lamps.size
  end
end
 
class ChristmasTree
  def initialize
    @lamp_factory = LampFactory.new
    @lamps_hung = 0
    dress_up_the_tree
  end
 
  def hang_lamp(color, branch_number)
    TreeBranch.new(branch_number).hang(@lamp_factory.get_lamp(color))
    @lamps_hung += 1
  end
 
  def dress_up_the_tree
    hang_lamp('red', 1)
    hang_lamp('blue', 1)
    hang_lamp('yellow', 1)
    hang_lamp('red', 2)
    hang_lamp('blue', 2)
    hang_lamp('yellow', 2)
    hang_lamp('red', 3)
    hang_lamp('blue', 3)
    hang_lamp('yellow', 3)
    hang_lamp('red', 4)
    hang_lamp('blue', 4)
    hang_lamp('yellow', 4)
    hang_lamp('red', 5)
    hang_lamp('blue', 5)
    hang_lamp('yellow', 5)
    hang_lamp('red', 6)
    hang_lamp('blue', 6)
    hang_lamp('yellow', 6)
    hang_lamp('red', 7)
    hang_lamp('blue', 7)
    hang_lamp('yellow', 7)
    p "Made #{@lamp_factory.get_total_lamps_made} total lamps"
  end
end
 
ChristmasTree.new