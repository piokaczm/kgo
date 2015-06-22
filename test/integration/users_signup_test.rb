require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    ActionMailer::Base.deliveries.clear
  end
  
  test "Invalid signup rejected" do
    get rejestracja_path
    assert_no_difference 'User.count' do
      post users_path, user: { username: "kaczmuch", 
                                name: "Piotr", 
                                email: "piokaczm@gmail.com", 
                                city: "Tychy", 
                                password: "foobar", 
                                password_confirmation: "fobbar" }
    end
    assert_template 'users/new'
    assert_not is_logged_in?
  end
  
  test "Valid signup should be accepted" do
    get rejestracja_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { username: "kaczmuch", 
                                name: "Piotr", 
                                email: "piokaczm@gmail.com", 
                                city: "Tychy",
                                wojewodztwo: "Śląskie",
                                password: "foobar", 
                                password_confirmation: "foobar" }
    end
    #assert_template 'users/show'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
    #assert is_logged_in?
  end
  
  test "Registration page should have link to FAQ" do
    get rejestracja_path
    assert_select "a[href=?]", faq_path, count=2
  end
  
  test "valid signup with activation" do
    get rejestracja_path
    assert_difference 'User.count', 1 do
      post users_path, user: { username: "kaczmuch", 
                                name: "Piotr", 
                                email: "piokaczm@gmail.com", 
                                city: "Tychy",
                                wojewodztwo: "Śląskie",
                                password: "foobar", 
                                password_confirmation: "foobar" }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    assert_not is_logged_in?
    get edit_account_activation_path("invalid token")
    assert_not is_logged_in?
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not is_logged_in?
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
  
    
end
