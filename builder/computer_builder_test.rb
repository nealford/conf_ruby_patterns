require "test/unit"

require "computer_builder"
require "computer"

class TestComputerBuilder < Test::Unit::TestCase
  def test_builder
    b = ComputerBuilder.new
    b.turbo
    b.add_cd(true)
    b.add_dvd
    b.add_hard_disk(100000)
    computer = b.computer
    assert computer.motherboard.cpu.is_a? TurboCPU
    assert computer.drives.size == 3
  end
  
  def test_synthetic_method
    b = ComputerBuilder.new
    b.add_turbo_and_dvd_and_harddisk
    assert b.computer.motherboard.cpu.is_a? TurboCPU
    assert b.computer.drives.size == 2
  end
end