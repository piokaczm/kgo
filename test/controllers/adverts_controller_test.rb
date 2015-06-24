require 'test_helper'

class AdvertsControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:piotr)
  end
  
  test "should get new" do
    login_as(@user)
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "new advert can be created only by logged in users" do
  end
  
  test "logged out user should be redirected" do
    get :new
    assert_not flash.empty?
    assert_redirected_to login_path
  end
  
end
