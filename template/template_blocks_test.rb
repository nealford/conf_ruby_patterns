require "test/unit"

require "template_blocks"

class TestTemplateBlocks < Test::Unit::TestCase
  def test_customer_derivative
    c = UsCustomer.new
    c.process
    assert_equal c.plan[0], "checking US customer credit"
    assert_equal c.plan[1], "checking US warehouses"
    assert_equal c.plan[2], "Shipping to US address"
  end
  
  def test_customer_with_optional_templates
    c = UsCustomerOptional.new
    c.process
    assert_equal c.plan[0], "checking US customer credit"    
    assert_equal c.plan[1], "Shipping to US address"    
  end
  
  def test_customer_with_alternate_process
    c = UsCustomerOptional.new
    c.process_succinct
    assert_equal c.plan[0], "checking US customer credit"    
    assert_equal c.plan[1], "Shipping to US address"    
  end
end