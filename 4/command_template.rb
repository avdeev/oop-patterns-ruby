class Database
  def query sql
    p "query: #{sql}"
  end
end

class Command
  attr_accessor :database
  def initialize database
    @database = database
  end
end

class DropDatabasesComand < Command
  def execute
    @database.query "drop databases;"
  end
  def undo

  end
end

class CreateDatabasesComand < Command
  def execute
    @database.query "create databases;"
  end
end

database = Database.new

command_list = []
command_list << DropDatabasesComand.new(database)
command_list << CreateDatabasesComand.new(database)
command_list << DropDatabasesComand.new(database)

command_list.each(&:execute)