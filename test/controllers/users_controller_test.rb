require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:piotr)
  end
  
  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Rejestracja | KGO"
  end
  
  test "should find user page" do
    assert_generates '/piopik', { controller: 'users', action: 'show', username: 'piopik' }
  end

end
