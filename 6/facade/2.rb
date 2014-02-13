class ImageLoader
  def initialize
    p 'loading images...'
  end
  def get
    p 'get images'
  end
end

class SoundLoader
  def initialize
    p 'loading sounds...'
  end
  def get
    p 'get sounds'
  end
end

class Loader
  attr_accessor :sound, :image
  def initialize
    @sound = SoundLoader.new
    @image = ImageLoader.new
  end
  def get_image
    @image.get
  end
  def get_sound
    @sound.get
  end
end

class Client
  def run
    loader = Loader.new
    loader.get_image
    loader.get_sound
  end
end

client = Client.new
client.run()