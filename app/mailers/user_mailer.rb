class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Aktywacja konta w serwisie KGO"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_test.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Reset hasła"
  end
  
  def contact_form(message)
    @message = message
    
    mail from: message.sender_email, to: message.receiver_email, subject: "Pytanie dotyczące #{message.subject}"
  end
  
  def contact_me(sender)
    @sender = sender
    mail from: sender.email, to: 'piokaczm@gmail.com', subject: "Kontakt: #{sender.subject}"
  end
  
  def invitation(invitation, user)
    @invitation = invitation
    @user = user
    mail to: invitation.email, subject: "Zostałeś zaproszony do KGO!"
  end
    
  
end
