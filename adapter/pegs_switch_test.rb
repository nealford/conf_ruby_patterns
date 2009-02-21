require "test/unit"

require "pegs_switch"

class TestPegsSwitching < Test::Unit::TestCase
  def test_pegs_switching
    hole = RoundHole.new( 4.0 )
    4.upto(7) do |i|
      peg = SquarePeg.new(i)
      peg.with_interface(:holes) do
        if (i < 6)
          assert hole.peg_fits?(peg)
        else 
          assert ! hole.peg_fits?(peg)
        end
      end
    end
  end
end