class Handler_2
  def handle number
    if number % 2 == 0
      p "#{number} processed by #{self.class.to_s}"
    end
  end
end

class Handler_3
  def handle number
    if number % 3 == 0
      p "#{number} processed by #{self.class.to_s}"
    end
  end
end

class Handler_4
  def handle number
    if number % 4 == 0
      p "#{number} processed by #{self.class.to_s}"
    end
  end
end

objects = 1..10
handlers = [Handler_4.new, Handler_2.new, Handler_3.new]

objects.each do |object|
  puts 'error' unless handlers.any? { |e| e.handle(object) }
end