require "test/unit"

require "forward_queue"
require 'thread'

class TestForwardQueue < Test::Unit::TestCase
  
  def setup
   @q = FQueue.new
   @q.enqueue "one"
   @q.enqueue "two"
  end
 
  def test_queue
    e = @q.dequeue                             
    assert_equal "one", e
  end
  
  def test_delegated_methods
    @q.enqueue "three"
    assert_equal 3, @q.size
    e = @q.dequeue
    assert_equal 2, @q.size
    assert_equal "one", e
    @q.clear
    assert_equal 0, @q.size
    assert @q.empty?
    assert_equal 0, @q.length
    @q << "new"
    assert_equal 1, @q.length
    
  end
  
  def test_non_delegated_methods
    assert_raise(NoMethodError) { @q.pop }
  end
  
  def test_delegating_to_array
    arr = Array.new
    q = FQueue.new arr
    q.enqueue "one"
    assert_equal 1, q.size
    assert_equal "one", q.dequeue
  end
  
  def test_delegating_to_a_queue
    a = Queue.new
    q = FQueue.new a
    q.enqueue "one"
    assert_equal 1, q.size
    assert_equal "one", q.dequeue
  end
  
  def test_delgating_to_a_sized_queue
    a = SizedQueue.new(12)
    q = FQueue.new a
    q.enqueue "one"
    assert_equal 1, q.size
    assert_equal "one", q.dequeue
  end
  
  TestForwardQueue.class_eval do
     [Array, Queue, SizedQueue].each do |c|
       method_name = ("test_queue_delegated_to_" + c.to_s).to_sym
       define_method method_name,lambda {
         if c == SizedQueue
           a = c.new 12
         else
           a = c.new
         end
         q = FQueue.new a
         q.enqueue "one"
         assert_equal 1, q.size
         assert_equal "one", q.dequeue
       }
     end
  end

end