require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:piotr)
  end
  
  test "flash shoud dissapear on new action" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { username: " ", password: " " }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "login should change header and login delete session" do
    get login_path
    post login_path session: { username: @user.username, password: "password" }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    get root_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", login_path, count:0
    assert flash.empty?
    delete logout_path
    assert_redirected_to root_path
    follow_redirect!
    assert_not is_logged_in?
    assert_template 'main_pages/home'
    assert_not flash.empty?
    assert_select "a[href=?", login_path
    assert_select "a[href=?]", logout_path, count=0    
  end
  
end
