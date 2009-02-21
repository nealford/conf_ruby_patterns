class SquarePeg
    attr_reader :width

    def initialize(width)
        @width = width
    end
end

class SquarePeg
    def radius
        Math.sqrt(((@width/2) ** 2) * 2 )
    end
end

class RoundPeg
    attr_reader :radius
    
    def initialize(radius)
        @radius = radius
    end
    
    def width
      @radius * @radius
    end
end

class RoundHole
    attr_reader :radius

    def initialize(r)
        @radius = r
    end
        
    def peg_fits?( peg )
        peg.radius <= radius
    end
end
