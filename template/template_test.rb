require "test/unit"

require "template"

class TestTemplate < Test::Unit::TestCase
  
  def test_template_methods_throw_exceptions_when_not_defined
    c = Customer.new
    assert_raise(RuntimeError) { c.check_credit }
    assert_raise(RuntimeError) { c.check_inventory }
    assert_raise(RuntimeError) { c.ship }
  end
  
  def test_customer
    c = UsCustomer.new
    c.process
    assert_equal c.plan[0], "checking US customer credit"
    assert_equal c.plan[1], "checking US warehouses"
    assert_equal c.plan[2], "Shipping to US address"
    e = EuropeanCustomer.new
    e.process     
    assert_equal e.plan[0], "checking European customer credit"
    assert_equal e.plan[1], "checking European warehouses"
    assert_equal e.plan[2], "Shipping to European address"    
  end
end