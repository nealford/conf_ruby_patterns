class Computer
  attr_accessor :display, :motherboard, :drives

  def initialize(display=:crt, motherboard=Motherboard.new, drives=[])
    @motherboard = motherboard
    @drives = drives
    @display = display
  end

end

class CPU
  # CPU stuff
end

class BasicCPU < CPU
  # not very fast CPU stuff
end

class TurboCPU < CPU
  # very fast CPU stuff
end

class Motherboard
  attr_accessor :cpu, :memory_size
  
  def initialize(cpu=BasicCPU.new, memory_size=1000)
    @cpu = cpu
    @memory_size = memory_size
  end
end

class Drive
  attr_reader :type, :size, :writable
  
  def initialize(type, size, writable)
    @type = type
    @size = size
    @writable = writable
  end
end