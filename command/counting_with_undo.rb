class Command
    def initialize(doit, undoit)
        @do = doit
        @undo = undoit
    end
    
    def do_command
        @do.call
    end
    
    def undo_command
        @undo.call
    end
end