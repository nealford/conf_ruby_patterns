require 'socket'
 
class Accumulator
    def accumulate( *args )
        total = 0
        args.each { |a| total = total + a }
        total
    end
end

def dispatch_call( object, socket )
    begin
        method = Marshal.load( socket )
        args = Array.new( Marshal.load( socket ) )
        args.each_index { |i| args[i] = Marshal.load( socket ) }
        
        result = object.__send__( method, *args )
         
        Marshal.dump( true, socket )
        Marshal.dump( result, socket )
        
    rescue => ex
        Marshal.dump( false, socket )
        Marshal.dump( ex, socket )
        
    ensure
        socket.close
    end
end
 
acc = Accumulator.new
server = TCPServer.new( '127.0.0.1', 54321 )
puts "waiting for connections on host 127.0.0.1, port 54321"
loop do
    dispatch_call( acc, server.accept )
end