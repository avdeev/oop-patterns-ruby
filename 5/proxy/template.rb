class Database
  def initialize
    p 'long initialize...'
  end

  def get_version
    p '5.5'
  end

  def query
    p 'query...'
  end
end

class DatabaseVirtualProxy
  attr_accessor :database
  def get_version 
    p '5.5'
  end
  def query
    @database = Database.new unless @database
    @database.query
  end
end

database = DatabaseVirtualProxy.new

database.get_version

database.query