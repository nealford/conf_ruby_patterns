require "test/unit"

require "counting_with_undo"

class TestCountingWithUndo < Test::Unit::TestCase
  def test_command_class
    count = 0
    commands = []
    (1..10).each do |i|
        commands << Command.new(
            proc { count += 1 }, proc { count -= 1 } )
    end    
    
    assert_equal(0, count)
    commands.each { |cmd| cmd.do_command }    
    assert_equal(10, count)
    commands.each { |cmd| cmd.undo_command}
    assert_equal(0, count)
  end
end