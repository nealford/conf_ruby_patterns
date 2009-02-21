class Document
  attr_accessor :title, :section, :author
                            
  def initialize
    @section = []
  end
end

class DocumentBuilder
  attr_reader :document
   
  def initialize
    @document = Document.new
  end
  
  def title=(title)
    @document.title = title
  end
  
  
end