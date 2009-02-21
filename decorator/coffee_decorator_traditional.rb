# from http://www.lukeredpath.co.uk/2006/9/6/decorator-pattern-with-ruby-in-8-lines

module Decorator
  def initialize(decorated)
    @decorated = decorated
  end

  def method_missing(method, *args)
    args.empty? ? 
      @decorated.send(method) : 
      @decorated.send(method, args)
  end
end

class Coffee
  def cost
    2
  end
end

class Milk
  include Decorator

  def cost
    @decorated.cost + 0.4
  end
end

class Whip
  include Decorator

  def cost 
    @decorated.cost + 0.2
  end
end

class Sprinkles
  include Decorator

  def cost
    @decorated.cost + 0.3
  end
end

