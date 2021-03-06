class AbstractFactory
  def create_button
    raise NotImplementedError, 'Sorry, you have to override'
  end
end

class WinFactory < AbstractFactory
  def create_button
    WinButton.new
  end
end
 
class LinFactory < AbstractFactory
  def create_button
    LinButton.new
  end
end

class MacFactory < AbstractFactory
  def create_menu
  end
end
 
class Button
  attr_accessor :caption
end
 
class WinButton < Button
  def render
    puts "I`m WinButton #{@caption}"
  end
end
 
class LinButton < Button
  def render
    puts "I`m LinButton #{@caption}"
  end
end
 
class Application
  def initialize(factory)
    button = factory.create_button
    button.caption = 'Start'
    button.render
  end
end

class ApplicationRunner
  def self.run
    Application.new(self.createOsSpecificFactory)
  end
 
  def self.createOsSpecificFactory
    if RUBY_PLATFORM.downcase.include?("mswin")
      WinFactory.new
    else
      LinFactory.new
    end
  end
end
 
ApplicationRunner.run