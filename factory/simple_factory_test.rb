require "test/unit"

require "simple_factory"

class TestSimpleFactory < Test::Unit::TestCase
  def test_creating_via_factory
    list = create_from_factory(Array)
    assert list.kind_of? Array

    hash = create_from_factory(Hash)
    assert hash.kind_of? Hash
  end
end