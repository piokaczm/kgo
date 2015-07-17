require 'test_helper'

class InvitationCreateTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:piotr)
    @user_no_inv_left = users(:cyc)
    @invitation = Invitation.create(email: 'pika@dupa.pl', user_id: @user.id)
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
    login_as(@user_no_inv_left)
    @invalid_invitation = Invitation.create(email: 'pika@dupa.pl', user_id: @user_no_inv_left.id)
    assert_not @invalid_invitation.save
  end
  
  test "invitation should be reacheable by logged in" do
    get new_invitation_path
    assert_not is_logged_in?
    assert_not flash.empty?
    assert_redirected_to login_path
  end
    
end
