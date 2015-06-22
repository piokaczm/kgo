require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:piotr)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)    
    assert_equal "Aktywacja konta w serwisie KGO", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
  end

  test "password_reset" do
    mail = UserMailer.password_test
    assert_equal "Password test", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["noreply@example.com"], mail.from
  end

end

