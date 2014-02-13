class Connect
  def initialize
    p 'connecting...'
  end
  def query
    p "#{self.object_id}: query..."
  end
end

require 'singleton'
class ConnectPool
  include Singleton
  attr_accessor :size, :connections 
  def set_size size
    p 'initialize pool'
    @size = size
    @connections = []
    size.times do |i|
      @connections << DatabaseConnect.new
    end
  end
  def get
    @connections.pop
  end
  def release connection
    if @connections.length < @size then
      @connections << connection
      @size += 1
    end
  end
end

pool = ConnectPool.instance
pool.set_size 4
5.times do
  connection = pool.get
  if connection
    connection.query
    pool.release connection
  end
end