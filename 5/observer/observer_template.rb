class Uploader
  def upload filename
    p "#{filename} uploaded"
  end
end

uploader = Uploader.new

uploader.upload 'test1.jpg'
uploader.upload 'test2.jpg'