class Filter
  def filter
    raise NotImplementedError
  end
end

class FilterDiv2 < Filter
  def filter a
    (a % 2 == 0)
  end
end

class FilterDiv3 < Filter
  def filter a
    (a % 3 == 0)
  end
end

class Filter10 < Filter
  def filter a
    (a < 10)
  end
end

class Filtrator
  def get_filter
    raise NotImplementedError
  end
  def run
    array = (0..20).to_a
    filter = self.get_filter()
    array.each_with_index do |i, value|
      if not filter.filter value
        array[i] = nil
      end
    end
    p array
  end
end

class Filtrator10 < Filtrator
  def get_filter
    Filter10.new
  end
end

filtrator = Filtrator10.new
filtrator.run()