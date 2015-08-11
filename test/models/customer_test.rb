require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = customers(:one)
  end

  test "should be valid" do
    assert @customer.valid?
  end

  test "should have name" do
    @customer.name = ""
    assert_not @customer.valid?
  end

  test "should have code" do
    @customer.code = ""
    assert_not @customer.valid?
  end

  test "name should be unique" do
    duplicate_customer = @customer.dup
    duplicate_customer.code = "XXX"
    assert_not duplicate_customer.valid?
  end

  test "code should be unique" do
    duplicate_customer = @customer.dup
    duplicate_customer.name = "XXX"
    assert_not duplicate_customer.valid?
  end


end
