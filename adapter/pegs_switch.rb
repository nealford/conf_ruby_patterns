require "interface_helper"

class SquarePeg
  include InterfaceSwitching
                         
  def radius
    @width
  end
  
  def_interface :square, :radius
  
  def radius
    Math.sqrt(((@width/2) ** 2) * 2)
  end

  def_interface :holes, :radius  
  
  def initialize(width)
    set_interface :square
    @width = width
  end
end

# class SquarePeg
#   def radius
#       Math.sqrt(((@width/2) ** 2) * 2)
#   end
# end

class RoundHole
  attr_reader :radius

  def initialize( r )
    @radius = r
  end
      
  def peg_fits?( peg )
    peg.radius <= @radius
  end
end