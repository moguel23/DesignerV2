require 'test_helper'

class DeviceViewsTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @customer = customers :one
    @product = products :one
    @device = devices :one
  end

  test "new devices" do
    get new_device_path :product => @product
    assert_template 'devices/new'
    assert_select 'title', full_title(@customer.name)
  end

  test "create new device" do
    assert_difference '@customer.devices.count', 1 do
      post devices_path, device: {name: "name"}, product: @product.id
    end
    follow_redirect!
    assert_template 'customers/show'
    assert_not flash.empty?
  end

  test "show device" do
    get device_path(@device)
    assert_template 'devices/show'
    assert_select 'title', full_title(@customer.name)
    assert_select 'h1', text: @customer.name
    assert_select 'a[href=?]', customer_path(@customer)
    assert_select 'h1', text: @product.name
    assert_select 'a[href=?]', product_path(@product)
    assert_match @device.name, response.body
    assert_match @device.device_type, response.body
  end

end
