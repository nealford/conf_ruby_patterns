require "test/unit"
require "recorder"

class TestRecorderNet < Test::Unit::TestCase
  def test_recorder
    r = Recorder.new
    r.sub!(/\.NET/) { "Ruby" }
    r.upcase!
    r[11, 5] = "Universe"
    r << "!"
    
    s = "Hello .NET World"
    r.play_back_to(s)
    assert_equal "HELLO RUBY Universe!", s
  end
end