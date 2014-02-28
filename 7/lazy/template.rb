class Post
  attr_accessor :content
  def initialize
    p 'initialize'
    p 'long loading'
    @content = 'content'
  end
  def get_content
    p @content
  end
end

p '------'
post = Post.new
p '------'
post.get_content