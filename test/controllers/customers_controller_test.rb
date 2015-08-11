require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  def setup
    @customer = customers(:one)
  end
  test "should get new" do
    get :new
    assert_response :success
  end

   test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end


  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @customer
    assert_response :success
  end

end
