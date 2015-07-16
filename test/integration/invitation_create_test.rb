require 'test_helper'

class InvitationCreateTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:piotr)
  end
  
  test "successful invitation" do
    login_as(@user)
    assert_difference 'Invitation.count', 1 do
      post_via_redirect invitations_path, invitation: { email: 'picza@kupa.com',
                                          user_id: @user.id}
    end
    assert_not flash.empty?
    assert_template 'invitations/new'
    post_via_redirect invitations_path, invitation: { email: 'picza@kupa.com',
                                                      user_id: @user.id}
    @user.reload
    assert 4, @user.invitations_left
  end  
  
  test "invitation shouldn't be send if limit is reached" do
    login_as(@user)
    @user.invitations_left = 0
    assert_no_difference 'Invitation.count' do
      post invitations_path, invitation: { email: 'picza@kupa.com',
                                          user_id: @user.id}
    end
  end
  
  
  
end
