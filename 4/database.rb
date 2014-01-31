class Database
  def self.new
    @instance ||= super 
  end
  def query
    p "query"
  end
end

database1 = Database.new
database2 = Database.new
p database1 == database2

database1.query()