require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # Test for valid user and redirect to dashboard
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password",
                                         primary_phone: '556-555-5555' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
  
end