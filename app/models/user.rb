class User < ActiveRecord::Base
  has_many :adverts, dependent: :destroy
  has_many :invitations
  has_secure_password
  before_save :is_invited?, unless: :admin?

  WOJLIST = %w(Dolnośląskie Kujawsko-pomorskie Lubelskie Lubuskie Łódzkie Małopolskie Mazowieckie Opolskie Podkarpackie Podlaskie Pomorskie Śląskie Świętokrzyskie Warmińsko-mazurskie Wielkopolskie Zachodniopomorskie)

  before_save :email_downcase
  before_create :create_activation_token
  validates :username, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :city, presence: true
  validates :wojewodztwo, allow_nil: true, inclusion: { in: WOJLIST }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, allow_nil: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def email_downcase
    self.email.downcase!
  end

  def create_activation_token
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def is_invited?
    unless !Invitation.find_by(email: self.email.downcase).nil?
      errors.add(:base, "Twojego e-maila nie ma na liście zaproszonych")
      false
    else
      true
    end
  end

  def admin?
    true if self.admin
  end
end
