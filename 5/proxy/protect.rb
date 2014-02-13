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

class DatabaseProtectProxy
  attr_accessor :database, :query_count
  def initialize
    @database = Database.new
    @query_count = 0
  end
  def query
    if @query_count < 5 then
      @database.query()
      @query_count += 1
    else
      p 'limit exceded'
    end
  end
end

database = DatabaseProtectProxy.new

10.times do 
  database.query
end