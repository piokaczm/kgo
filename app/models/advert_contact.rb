class AdvertContact

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :sender_email, :receiver_email, :content, :subject

  validates :name, presence: true
  validates :sender_email, presence: true
  validates :content, presence: true
  validates :subject, presence: true
  validates :receiver_email, presence: true

end