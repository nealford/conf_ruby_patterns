class MultStrategies
  attr_reader :strategies
  
  def initialize() 
     @strategies = [
       proc { |n, m| n * m}
     ]
  end
  
  def add_strategy(&block)
    @strategies << block
  end
end

