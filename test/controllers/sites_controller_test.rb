require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  def setup
    @customer = customers(:one)
    @site = sites(:one)
  end

  test "should get new" do
    get :new, customer: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site
    assert_response :success
  end

  test "should get show" do
    get :show, id: @site
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
