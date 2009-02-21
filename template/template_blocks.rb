class Customer
  attr_accessor :plan, :check_credit, :check_inventory, :ship
  
  def initialize
    @plan = []
  end
  
  def process
    @check_credit.call
    @check_inventory.call
    @ship.call
  end
end

class UsCustomer < Customer
   def initialize
     super
     @check_credit = lambda { plan << "checking US customer credit"}
     @check_inventory = lambda { plan << "checking US warehouses"}
     @ship = lambda { plan << "Shipping to US address"}
   end
end

class CustomerWithOptionalTemplates
  attr_accessor :plan, :check_credit, :check_inventory, :ship
  
  def initialize
    @plan = []
  end
  
  def process
    @check_credit.call unless @check_credit.nil?
    @check_inventory.call unless @check_inventory.nil?
    @ship.call unless @ship.nil?
  end   
  
  def process_succinct
    [@check_credit, @check_inventory, @ship].each do |p|
      p.call unless p.nil?
    end       
  end
end

class UsCustomerOptional < CustomerWithOptionalTemplates
   def initialize
     super
     @check_credit = lambda { plan << "checking US customer credit"}
     @ship = lambda { plan << "Shipping to US address"}
   end
end
