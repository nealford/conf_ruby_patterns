require "test/unit"

require "counting"

class TestCounting < Test::Unit::TestCase
  def test_counting
    count = 0
    commands = []
    (1..10).each do |i|
        commands << proc { count += 1 }
    end

    assert_equal(0, count)
    commands.each { |c| c.call }
    assert_equal(10, count)    
  end
end