class Animal
  def sound
    throw NotImplementedError
  end
end

class Dog < Animal
  def sound
    'bark'
  end
end

class NilAnimal < Animal
  def sound; end
end

def get_animal(type)
  case type
  when :dog
    Dog.new
  when nil
    NilAnimal.new
  end
end

p get_animal(:dog).sound
p get_animal(nil).sound