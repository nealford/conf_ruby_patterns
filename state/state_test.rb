require "test/unit"

require "state"

class TestState < Test::Unit::TestCase
  def test_state_recording
    client = Client.new
    client.send_message("Hello")
    client.connect
    client.send_message("Hello")
    client.connect
    client.receive_message
    assert_equal "offline", client.log[0]
    assert_equal "error: not connected", client.log[1]
    assert_equal "connected", client.log[2]
    assert_equal "\"Hello\" sent", client.log[3]
    assert_equal "error: already connected", client.log[4]
    assert_equal "message received", client.log[5]
  end
end         