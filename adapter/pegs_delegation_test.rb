require "test/unit"

require "pegs_delegation"

class TestPegs < Test::Unit::TestCase
  def test_pegs
    hole = RoundHole.new(4.0)
    4.upto(7) do |i|
        peg = SquarePegAdaptor.new(SquarePeg.new(i))
        if (i < 6)
          assert hole.peg_fits?(peg)
        else
          assert ! hole.peg_fits?(peg)
        end
    end
  end
end