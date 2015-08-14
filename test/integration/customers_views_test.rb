require 'test_helper'

class CustomersViewsTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @customer = customers(:one)
  end

  test "customer show" do
    get customer_path(@customer)
    assert_template 'customers/show'
    assert_select 'title', full_title(@customer.name)
    assert_select 'h1', text: @customer.name
    assert_match @customer.code, response.body
    assert_select 'a[href=?]', new_site_path(:customer => @customer.id)
    @customer.sites.each do |site|
      assert_match site.name, response.body
    end
    assert_select 'a[href=?]', new_product_path(:customer => @customer.id)
    @customer.products.each do |product|
      assert_match product.name, response.body
    end
  end

  test "customers index" do
    get customers_path
    assert_template 'customers/index'
    assert_select 'a[href=?]', new_customer_path
    customers.each do |customer|
      assert_match customer.name, response.body
    end
  end
end
