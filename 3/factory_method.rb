class Feed
  def create_publication
    raise NotImplementedError
  end
end

class News < Feed
  def create_publication
    NewsView.new
  end
end

class Gallery < Feed
  def create_publication
    GalleryView.new
  end
end

class NewsView
  def initialize
    p "I'm news"
  end
end

class GalleryView
  def initialize
    p "I'm Gallery"
  end
end

news = News.new
news.create_publication()