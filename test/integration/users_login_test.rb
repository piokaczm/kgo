require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "flash shoud dissapear on new action" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { username: " ", password: " " }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
