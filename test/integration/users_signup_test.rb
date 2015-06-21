require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
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
    assert_template 'users/show'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
    assert is_logged_in?
  end
  
  test "Registration page should have link to FAQ" do
    get rejestracja_path
    assert_select "a[href=?]", faq_path, count=2
  end
  
end
