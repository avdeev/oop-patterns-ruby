class Publication
  attr_accessor :content
  def initialize
    p 'long initialize...'
  end
end

class Post < Publication

end

postPrototype = Post.new

posts = []
5.times do
  posts << postPrototype.clone
end