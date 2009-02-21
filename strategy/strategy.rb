class Context 
  attr_accessor :strategy 
  def do(*args)
    strategy.call(*args)
  end
end

ctx=Context.new
ctx.strategy= proc { do stuff }
ctx.do(some, args)

class Context 
end

module MyStrategy
  def do(*args)
    #stuff
  end
end

ctx=Context.new
ctx.extend MyStrategy
ctx.do(some, args)