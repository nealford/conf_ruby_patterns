class Customer
  attr_accessor :plan
  
  def initialize
    @plan = []
  end
  
  def check_credit                          
    raise "Must override this method"
  end                                
  
  def check_inventory
    raise "Must override this method"
  end
  
  def ship
    raise "Must override this method"
  end
  
  def process
    check_credit
    check_inventory
    ship
  end
  
end

class UsCustomer < Customer
   def check_credit
     plan << "checking US customer credit"
   end
   
   def check_inventory
     plan << "checking US warehouses"
   end
   
   def ship
     plan << "Shipping to US address"
   end
end

class EuropeanCustomer < Customer
  def check_credit
    plan << "checking European customer credit"
  end
  
  def check_inventory
    plan << "checking European warehouses"
  end
  
  def ship
    plan << "Shipping to European address"
  end
  
end