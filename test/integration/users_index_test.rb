require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:piotr)
  end
  
  test "should show index including pagination" do
    login_as(@user)
    get users_path
    assert_template 'users/index'
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.username
    end
  end
    
end
