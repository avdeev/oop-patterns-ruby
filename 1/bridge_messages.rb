class Site
  attr_accessor :message
  def showMessage
  end
end

class LifenewsRu < Site
  def showMessage
    puts "--- LifenewsRu ---"
    @message.show()
    puts "------"
  end
end

class IzvestiaRu < Site
  def showMessage
    puts "------ IzvestiaRu -----"
    @message.show()
    puts "------"
  end
end

class Message
  def show
    
  end
end

class Error < Message
  def show
    puts "Error"
  end
end

class Notice < Message
  def show
    puts "Notice"
  end
end

site = IzvestiaRu.new

site.message = Notice.new 
site.showMessage()