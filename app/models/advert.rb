class Advert < ActiveRecord::Base
  
  mount_uploader :picture, AdvertPhotoUploader
  
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  WOJLIST = %w(Dolnośląskie Kujawsko-pomorskie Lubelskie Lubuskie Łódzkie Małopolskie Mazowieckie Opolskie Podkarpackie Podlaskie Pomorskie Śląskie Świętokrzyskie Warmińsko-mazurskie Wielkopolskie Zachodniopomorskie)
  TYPELIST = %w(rowery ramy widelece korby koła kierownice mostki sztyce siodła inne)
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: true
  validates :wojewodztwo, presence: true, inclusion: { in: WOJLIST }
  validates :new, inclusion: { in: [true, false] } 
  validates :size1, numericality: { only_integer: true }
  validates :size2, numericality: true
  validates :city, presence: true
  validates :category, presence: true, inclusion: { in: TYPELIST }
  
  def self.types
    %w(Rower Rama Widelec Korba Kolo Kierownica Mostek Sztyca Siodlo Inne)
  end
  
end
