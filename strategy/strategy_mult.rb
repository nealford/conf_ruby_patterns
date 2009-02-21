module Strategy
  def execute; end    
end

class CalcByMult 
  include Strategy

  def execute(n, m) 
   n * m
  end
end

class CalcByAdds
  include Strategy

  def execute(n, m)
    result = 0
    n.times do
      result += m
    end
    result
  end
end
