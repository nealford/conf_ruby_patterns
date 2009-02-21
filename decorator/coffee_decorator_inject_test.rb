require "test/unit"
require "coffee_decorator_inject"

class TestCoffeeDecoratorInjectTest < Test::Unit::TestCase
  def test_decorator_works_via_inject
    x = Coffee.with Sprinkles, Whipped
    assert_equal 2.5, x.cost
  end
  
end
