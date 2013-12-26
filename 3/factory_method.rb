class Feed
  def create_publication
    raise NotImplementedError
  end
end

class News < Feed
  def create_publication
    "I'm news"
  end
end

class Gallery < Feed
  def create_publication
    "I'm Gallery"
  end
end

news = News.new
news.create_publication()