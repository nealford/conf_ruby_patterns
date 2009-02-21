require "test/unit"
require "recorder"

class TestRecorder < Test::Unit::TestCase
  def test_recorder
    r = Recorder.new
    r.sub!(/Java/) { "Ruby" }
    r.upcase!
    r[11, 5] = "Universe"
    r << "!"
    
    s = "Hello Java World"
    r.play_back_to(s)
    assert_equal "HELLO RUBY Universe!", s
    
  end
end