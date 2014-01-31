class Database
  attr_accessor :db
  def initialize db
    @db = db
  end
  def query sql
    @db.query sql
  end
end

class MySQL
  def query sql
    p "MySQL: #{sql}"
  end
end

class PSQL
  def pquery sql
    p "PSQL: #{sql}"
  end
end

class Redis
  def redis_query params
    p "Redis Query: #{params}"
  end
end

class PSQLAdapter
  attr_accessor :adaptee
  def initialize adaptee
    @adaptee = adaptee
  end
  def query sql
    @adaptee.pquery sql
  end
end

database = Database.new PSQLAdapter.new PSQL.new

database.query "SELECT * FROM `main`;"