require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:piotr)
  end
  
  test "unsuccessful edit" do
    login_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: {  username: "  ",
                                          name: "  ",
                                          email: "ku@pa",
                                          city: "Cycki",
                                          województwo: @user.wojewodztwo,
                                          password: "kau",
                                          password_confirmation: "szau"}
    assert_template 'users/edit'
  end
      
  test "successful edit with correct redirection" do
    get edit_user_path(@user)
    login_as(@user)
    assert_redirected_to edit_user_path(@user)
    follow_redirect!
    assert_template 'users/edit'
    username = "piczka"
    email = "piczka@picze.com"
    patch user_path(@user), user: { username: username,
                                    name: @user.name,
                                    email: email,
                                    city: @user.city,
                                    województwo: @user.wojewodztwo,
                                    password: "",
                                    password_confirmation: "" }
    assert_redirected_to @user
    follow_redirect!
    assert_not flash.empty?
    @user.reload
    assert_equal username, @user.username
    assert_equal email, @user.email
    delete logout_path
    follow_redirect!
    assert_template 'main_pages/home'
    get login_path
    post login_path session: { username: @user.username, password: "password" }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
  end
    
  
end
