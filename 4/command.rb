class Command
  attr_accessor :database
  def initialize database
    @database = database
  end
end

class DropCommand < Command
  def execute
    database.query "command"
  end
end

class SelectCommand < Command
  def execute
    database.query "select"
  end
end

class Database
  def query sql
    p "query: #{sql}"
  end
end

database = Database.new

commands = []
commands << SelectCommand.new(database)
commands << DropCommand.new(database)

commands.each do |command|
  command.execute()
end