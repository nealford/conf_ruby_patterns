require "test/unit"

require "coffee_decorator_extend"

class TestCoffeeDecoratorExtend < Test::Unit::TestCase
  def test_decorator_decorates_correctly
    x = Coffee.new
    x.extend Sprinkles
    x.extend Whipped
    assert_equal 2.5, x.cost
  end
end