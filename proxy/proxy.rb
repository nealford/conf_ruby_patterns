                 
require 'socket'

class Proxy
    def initialize( host, port )
        @host = host
        @port = port
    end
    
    def type
        @target.type
    end
    
    def method_missing( name, *args )
        socket = TCPSocket.new( @host, @port )
        begin
            # Send request to server
            Marshal.dump( name, socket )
            Marshal.dump( args.length, socket )
            args.each { |a| Marshal.dump( a, socket ) }
            socket.flush
            
            # Get reply from server
            is_ok = Marshal.load( socket ) # will return a boolean
            result = Marshal.load( socket )
            
            if is_ok
                # The server has returned the result of the remote method
                return result
            else
                # The server has returned an exception
                raise result
            end
            
        ensure
            socket.close
        end
    end
end