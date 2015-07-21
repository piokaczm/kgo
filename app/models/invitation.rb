class Invitation < ActiveRecord::Base
  
  belongs_to :user
  before_validation :invitation_available?, message: "Wykorzystałeś już wszystkie zaproszenia!"
  before_save :downcase
  

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: true
  validates :user_id, presence: true, numericality: { only_integer: true }
  
  def invitation_available?
    self.user.invitations_left > 0 ? true : false
  end
  
  def send_invitation
    UserMailer.invitation(self, self.user).deliver_now
  end
  
  def downcase
    self.email.downcase!
  end
  
end
