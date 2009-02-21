require "test/unit"
require 'rubygems'
require 'dust'
require 'mocha'
require "../lib/iterator_fun"

class TestIteratorFun < Test::Unit::TestCase
  
  def setup
    @it = IteratorDemo.new
    @numbers = [1, 2, 3, 4]
    @words = %w(first second third fourth)    
  end

  test "simple iterator" do
    assert_equal("1 2 3 4 ", 
        @it.print_all_in(@numbers))
    assert_equal("first second third fourth ", 
        @it.print_all_in(@words))
  end

  test "internal iterator" do
    assert_equal("1 2 3 4 ", 
        @it.print_all_with_internal(@numbers))
    assert_equal("first second third fourth ", 
        @it.print_all_with_internal(@words))
  end
end
