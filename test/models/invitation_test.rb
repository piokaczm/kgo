require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  
  def setup
    @invitation = invitations(:one)
  end
  
  test "email should be unique" do
    inv2 = Invitation.create(email: @invitation.email, user_id: 200)
    assert_not inv2.valid?
  end
  
  test "email should be downcase" do
    @invitation.email.upcase!
    @invitation.reload
    @invitation.save
    assert 'piokaczm@gmail.com', @invitation.email
  end
  
end
