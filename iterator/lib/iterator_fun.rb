class IteratorDemo
  def print_all_in container
    output = ""      
    for i in 0..container.length - 1 do
      output += "#{container[i]} "
    end
    output
  end

  def print_all_with_internal container
    output = ""
    container.each do |n|
      output += "#{n} "
    end
    output
  end
  
end





