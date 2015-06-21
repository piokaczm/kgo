require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:piotr)
    @other_user = users(:cyc)
  end
  
  test "should show another user profile" do
    login_as(@user)
    get user_path(@other_user)
    assert_select 'title', @other_user.username + " | KGO"
    assert_select 'a[href=?]', edit_user_path(@user), count=0
    assert_select 'h2', @other_user.username
  end
    
end
