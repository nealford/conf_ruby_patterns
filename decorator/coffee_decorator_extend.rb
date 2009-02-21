module Whipped
  def cost 
    super + 0.2
  end
end

module Sprinkles
  def cost
    super + 0.3
  end
end

class Coffee
  def cost
    2
  end
end 

