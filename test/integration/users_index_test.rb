require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @admin = users(:piotr)
    @non_admin = users(:cyc)
  end
  
  test "should show index including pagination" do
    login_as(@admin)
    get users_path
    assert_template 'users/index'
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.username
    end
  end
  
  test "index as admin with users list and delete option" do
    login_as(@admin)
    get users_path
    assert_template 'users/index'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.username
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'Usuń'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end
  

  
end
