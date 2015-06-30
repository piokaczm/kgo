# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_test
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end
  
  def contact_form
    message = AdvertContact.new( name: "Piotr",
                sender_email: "pika@pio.pl",
                content: "Cipka duapka cycki",
                subject: "Cycuchy",
                receiver_email: "piczkon@picze.pl" )
    UserMailer.contact_form(message)
  end

end
