require "test/unit"
require "queue"

class TestLimitedQueue < Test::Unit::TestCase
  
  def setup
    @q = DelegateQueue.new
    @q.enqueue "one"
    @q.enqueue "two"
  end
  
  def test_queuing
    e = @q.dequeue
    assert_equal "one", e
  end
  
  def test_non_delegated_methods
    @q = DelegateQueue.new
    @q.enqueue "one"
    @q.enqueue "two"
    assert_equal 2, @q.size
    e = @q.dequeue
    assert_equal 1, @q.size
    assert_equal e, "one"
  end
  
end
