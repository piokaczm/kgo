require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:ciul)
    @other_user = users(:cyc)
  end
  
  test "should show another user profile" do
    get user_path(id: 2)
    assert_template 'users/show'
  end
  
end