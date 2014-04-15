class Aggregate
  attr_accessor :items

  def initialize
    @items = []
  end

  def get_iterator
    Iterator.new self
  end

  def count
    @items.length
  end

  def [] key
    @items[key]
  end

  def []= key, value
    @items[key] = value
  end

end

class Iterator
  attr_accessor :aggregate, :current

  def initialize aggregate
    @aggregate = aggregate
    @current = 0
  end
 
  def first
    @aggregate[0]
  end
 
  def next
    if @current < @aggregate.count
      @current += 1
      @aggregate[@current]
    end
  end

  def current_item
    @aggregate[@current]
  end

  def is_done
    @current >= @aggregate.count
  end

end

aggregate = Aggregate.new
aggregate[0] = "Item A"
aggregate[1] = "Item B"
aggregate[2] = "Item C"
aggregate[3] = "Item D"

iterator = aggregate.get_iterator

# item = iterator.first
# until iterator.is_done
#   p item
#   item = iterator.next
# end

aggregate.items.each{ |item| p item }