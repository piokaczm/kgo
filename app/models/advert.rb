class Advert < ActiveRecord::Base
  
  mount_uploader :picture, AdvertPhotoUploader
  
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  WOJLIST = %w(Dolnośląskie Kujawsko-pomorskie Lubelskie Lubuskie Łódzkie Małopolskie Mazowieckie Opolskie Podkarpackie Podlaskie Pomorskie Śląskie Świętokrzyskie Warmińsko-mazurskie Wielkopolskie Zachodniopomorskie)
  TYPELIST = %w(rowery ramy widelce korby koła kierownice mostki sztyce siodła inne)
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: true
  validates :wojewodztwo, presence: true, inclusion: { in: WOJLIST }
  validates :new, inclusion: { in: [true, false] } 
  validates :size1, numericality: { only_integer: true }, :unless => :not_require_both_sizes?
  validates :size2, numericality: true, :unless => :not_require_size2?
  validates :city, presence: true
  validates :category, presence: true, inclusion: { in: TYPELIST }
  validates :picture, presence: true
  
  def self.types
    %w(Rower Rama Widelec Korba Kolo Kierownica Mostek Sztyca Siodlo Inne)
  end
  
  def not_require_size2?
    list = ["korby", "koła", "inne", "siodła"]
    list.include?(self.category)
  end
  
  def not_require_both_sizes?
    list = ["inne", "siodła"]
    list.include?(self.category)
  end
  
  
end
