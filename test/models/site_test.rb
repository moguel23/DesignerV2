require 'test_helper'

class SiteTest < ActiveSupport::TestCase
 def setup
   @site = sites(:one)
 end

  test "should be valid" do
    assert @site.valid?
  end

  test "should have name" do
    @site.name = ""
    assert_not @site.valid?
  end

  test "should have code" do
    @site.code = ""
    assert_not @site.valid?
  end

  end
