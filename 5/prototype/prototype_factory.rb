class Publication
  attr_accessor :content
  def initialize
    p 'long initialize...'
  end
end

class Post < Publication

end

class PrototypeFactory
  attr_accessor :post_prototype
  def initialize 
    @post_prototype = Post.new
  end
  def get_post
    @post_prototype.clone
  end
end

factory = PrototypeFactory.new

posts = []
5.times do
  posts << factory.get_post
end