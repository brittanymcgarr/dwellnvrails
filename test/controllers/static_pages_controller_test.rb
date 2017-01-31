require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "dwellNV | Welcome Home"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end
  
  test "should get listings" do
    get listings_path
    assert_response :success
  end
  
  test "should get renobb" do
    get renobb_path
    assert_response :success
  end

end
