class Handler_2 < Handler
  def handle number
    if number % 2 == 0
      p "#{number} processed by #{self.class.to_s}"
    end
  end
end

class Handler_3 < Handler
  def handle number
    if number % 3 == 0
      p "#{number} processed by #{self.class.to_s}"
    end
  end
end

class Handler_4 < Handler
  def handle number
    if number % 4 == 0
      p "#{number} processed by #{self.class.to_s}"
    end
  end
end

objects = 1..10