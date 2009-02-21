count = 0
commands = []
(1..10).each do |i|
    commands << proc { count += 1 }
end

puts "count is initially #{count}"
commands.each { |cmd| cmd.call }
puts "did all commands, count is #{count}"


