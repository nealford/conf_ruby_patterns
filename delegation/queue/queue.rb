require 'delegate'

class DelegateQueue < DelegateClass(Array)
  def initialize(arg=[])
    super(arg)  
  end
  
  alias_method :enqueue, :push
  alias_method :dequeue, :shift
end