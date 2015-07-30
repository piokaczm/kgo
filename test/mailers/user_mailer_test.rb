require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:piotr)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)    
    assert_equal "Aktywacja konta w serwisie KGO", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@kagieo.pl"], mail.from
  end

  test "password_reset" do
    user = users(:piotr)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "Reset hasła", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@kagieo.pl"], mail.from
    assert_match user.reset_token,        mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end
  
  test "contact_form" do
    @user = users(:piotr)
    @advert = adverts(:one)
    @message = AdvertContact.new( name: "Piotr",
                sender_email: "pika@pio.pl",
                content: "Cipka duapka cycki",
                subject: @advert.title,
                receiver_email: @user.email)
    mail = UserMailer.contact_form(@message)
    assert_equal ["pioka@gmail.com"], mail.to
    assert_equal ["pika@pio.pl"], mail.from
  end
      
  
end

