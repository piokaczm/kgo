class AdvertContact < MailForm::Base
  
  attribute :name,      :validate => true
  attribute :sender_email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :receiver_email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :content
  attribute :nickname,  :captcha  => true
  attribute :subject, :validate => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "#{subject}",
      :to => "#{receiver_email}",
      :from => %("#{name}" <#{sender_email}>)
    }
  end
end
  

