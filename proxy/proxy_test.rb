require "test/unit"

require "proxy"

class TestProxy < Test::Unit::TestCase
  def test_proxy
    proxy = Proxy.new( '127.0.0.1', 54321 )
    assert_equal 55, proxy.accumulate( 1,2,3,4,5,6,7,8,9,10 )    
  end
end