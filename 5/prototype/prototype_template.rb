class Publication
  def initialize
    p 'long initialize...'
  end
end

class Post < Publication

end

posts = []
5.times do
  posts << Post.new
end