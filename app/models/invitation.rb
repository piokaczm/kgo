class Invitation < ActiveRecord::Base
  
  belongs_to :user
  before_validation :invitation_available?, message: "Wykorzystałeś już wszystkie zaproszenia!"
  
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :user_id, presence: true, numericality: { only_integer: true }
  
  def invitation_available?
    self.user.invitations_left > 0 ? true : false
  end
  
end
