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

class Client
  def run
    image_loader = ImageLoader.new
    sound_loader = SoundLoader.new
    
    image_loader.get
    sound_loader.get
  end
end

client = Client.new
client.run()