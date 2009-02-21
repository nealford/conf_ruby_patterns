require 'forwardable'

class FQueue
  extend Forwardable
  
  def initialize(obj=[])
    @queue = obj
  end

  def_delegator :@queue, :push, :enqueue
  def_delegator :@queue, :shift, :dequeue
  def_delegators :@queue, :clear, :empty?, :length, :size, :<<
end


