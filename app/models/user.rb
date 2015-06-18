class User < ActiveRecord::Base
  
  before_save { self.email.downcase! }
  has_secure_password
  validates :username, presence: true, length: { maximum: 20 },
            uniqueness: { case_sensitive: false }        
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  validates :address, presence: true
  validates :city, presence: true
  validates :zip, presence: true, format: { with: /\A\d+\d+[-]+\d+\d+\d\z/ }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  
  
end
