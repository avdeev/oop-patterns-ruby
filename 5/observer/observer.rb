class Observable
  attr_accessor :observers
  def initialize
    @observers = []
  end
  def add_observer observer
    @observers << observer
  end
  def notify_observers filename
    @observers.each do |observer|
      observer.update filename
    end
  end
end

class Observer
  attr_accessor :object
  def initialize object
    @object = object
    @object.add_observer self
  end
end

class Uploader < Observable
  def upload filename
    notify_observers filename
  end
end

class ConsoleObserver < Observer
  def update filename
    p "console: #{filename} uploaded"
  end
end

class MailObserver < Observer
  attr_accessor :mail
  def initialize object, mail
    @mail = mail
    super object
  end
  def update filename
    p "mail #{mail}: #{filename} uploaded"
  end
end

uploader = Uploader.new

observer_1 = ConsoleObserver.new uploader

observer_2 = MailObserver.new uploader, 'test@ya.ru'

uploader.upload 'test1.jpg'
uploader.upload 'test2.jpg'