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
  def self.with(*args)
    args.inject(self.new) {|memo, val| memo.extend val}
  end

  def cost
    2
  end
end    

