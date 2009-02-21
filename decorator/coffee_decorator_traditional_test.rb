require "test/unit"

require "coffee_decorator_traditional"


class TestCoffeeDecoratorTraditional < Test::Unit::TestCase
  def test_that_decoration_works
    assert_equal 2.2, 
        Whip.new(Coffee.new).cost
    assert_equal 2.9, 
        Sprinkles.new(Whip.new(Milk.new(Coffee.new))).cost    
  end
end