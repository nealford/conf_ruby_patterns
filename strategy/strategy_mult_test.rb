require "test/unit"
require "strategy_mult"

class TestStrategyMult < Test::Unit::TestCase
  def setup
    @data = [
      [3, 4, 12],
      [5, -5, -25]
    ]
  end
  
  def test_mult
    c = CalcByMult.new
    @data.each do |l|
      assert_equal(l[2], c.execute(l[0], l[1]))
    end
  end
  
  def test_adds
    c = CalcByAdds.new
    @data.each do |l|
      assert_equal(l[2], c.execute(l[0], l[1]))
    end    
  end
  
  def test_as_strategies
    [CalcByMult.new, CalcByAdds.new].each do |s|
      @data.each do |l|
        assert_equal(l[2], s.execute(l[0], l[1]))
      end    
    end
  end
end