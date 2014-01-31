require 'singleton'
class Database
  include Singleton
  def query
    p "query"
  end
end

database1 = Database.instance
database2 = Database.instance
p database1 == database2

database1.query()