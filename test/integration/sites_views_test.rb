require 'test_helper'

class SitesViewsTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @site = sites(:one)
    @customer = customers(:one)
  end

  test "site show" do
    get site_path(@site)
    assert_template 'sites/show'
    assert_select 'title', full_title(@customer.name)
    assert_select 'h1', text: @customer.name
    assert_select 'a[href=?]', customer_path(@customer)
    assert_match @site.name, response.body
    assert_match @site.code, response.body
    assert_match @site.site_type, response.body
    assert_match @site.total_users.to_s, response.body
  end


  test "new sites" do
    get new_site_path :customer => @customer
    assert_template 'sites/new'
    assert_select 'title', full_title(@customer.name)
  end

  test "create new site" do
    assert_difference '@customer.sites.count', 1 do
      post sites_path, site: {name: "name", code: "code"}, customer: @customer.id
    end
    follow_redirect!
    assert_template 'customers/show'
    assert_not flash.empty?
  end


end
