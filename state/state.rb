class Client
  
  def initialize
    @context = Context.new
  end
  
  def log
    @context.state.log
  end
  
  def connect
    @context.state.connect
  end
  
  def disconnect
    @context.state.disconnect
  end
  
  def send_message(message)
    @context.state.send_message(message)
  end
  
  def receive_message
    @context.state.receive_message
  end

private
  class Context
    def initialize
      @state = Offline.new(self)
    end   
    
    attr_accessor :state
  end
end

class ClientState  
  @@log = []
  def self.log
    @@log
  end
  
  def log
    @@log
  end
  
  def initialize(context)
    @context = context
    inform
  end
end

class Offline < ClientState
  def inform
    @@log << "offline"
  end

  def connect
    @context.state = Online.new(@context)
  end     
  
  def disconnect
    @@log << "error: not connected"
  end

  def send_message(message) 
    @@log << "error: not connected"
  end

  def receive_message
    @@log << "error: not connected"
  end
end

class Online < ClientState
  def inform   
    @@log << "connected"
  end

  def connect
    @@log << "error: already connected"
  end

  def disconnect
    @context.state = Offline.new(@context)
  end

  def send_message(message)
    @@log << "\"#{message}\" sent"
  end

  def receive_message
    @@log << "message received"
  end
end