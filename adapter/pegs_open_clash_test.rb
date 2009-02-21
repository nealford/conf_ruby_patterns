require "test/unit"

require "pegs_open_clash"

class TestPegsOpen < Test::Unit::TestCase
  def test_open_class_pegs
    hole = RoundHole.new( 4.0 )
    4.upto(7) do |i|
      peg = SquarePeg.new(i.to_f)  
      if (i < 6)
        assert hole.peg_fits?(peg)
      else 
        assert ! hole.peg_fits?(peg)
      end
    end
  end
end