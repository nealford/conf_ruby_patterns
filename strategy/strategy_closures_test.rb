require "test/unit"
require "strategy_closures"

class TestStrategyClosures < Test::Unit::TestCase
  def setup
    @data = [
      [3, 4, 12],
      [5, -5, -25]
    ]
  end

  def test_strategies
    s = MultStrategies.new
    s.strategies.each do |s|
      @data.each do |l|
        assert_equal(l[2], s.call(l[0], l[1]))
      end            
    end
  end
  
  def test_adding_strategy
    s = MultStrategies.new
    s.add_strategy do |n, m|
      result = 0
      n.times { result += m }
      result
    end
    s.strategies.each do |s|
      @data.each do |l|
        assert_equal(l[2], s.call(l[0], l[1]))
      end            
    end
  end
end