require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:piotr)
    @other_user = users(:cyc)
  end
  
  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Rejestracja | KGO"
  end
  
  test "should find user page" do
    assert_generates '/piopik', { controller: 'users', action: 'show', username: 'piopik' }
  end
  
  test "unauthorized edit should redirect to login" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_path
  end
  
  test "unauthorized update should redirect to login" do
    patch :update, id: @user, user: { username: @user.username, name: @user.username,
                              email: @user.email, city: @user.city }
    assert_not flash.empty?
    assert_redirected_to login_path
  end
  
  test "should deny access for wrong user" do
    login_as(@other_user)
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to root_path
  end
  
  test "should deny update for wrong user" do
    login_as(@other_user)
    patch :update, id: @user, user: { username: @user.username, name: @user.name,
                                      email: @user.email, city: @user.city }
    assert_not flash.empty?
    assert_redirected_to root_path
  end
  
  test "should redirect user if not logged in" do
    get :index
    assert_not flash.empty?
    assert_redirected_to login_path
  end
  
  #test "should redirect user if not admin" do
  #  login_as(@other_user)
  #  get :index
  #  assert_not flash.empty?
  #  assert_redirected_to root_path
  #end
  
end
