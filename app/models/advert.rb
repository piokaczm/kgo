class Advert < ActiveRecord::Base
  
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }  
  scope :inne, -> { where(type: "Inne") }
  scope :kierownice, -> { where(type: "Kierownica") }
  scope :kola, -> { where(type: "Kolo") }
  scope :korby, -> { where(type: "Korba") }
  scope :mostki, -> { where(type: "Mostek") }
  scope :ramy, -> { where(type: "Rama") }
  scope :rowery, -> { where(type: "Rower") }
  scope :siodla, -> { where(type: "Siodlo") }
  scope :sztyce, -> { where(type: "Sztyca") }
  scope :widelce, -> { where(type: "Widelec") }
  
  WOJLIST = %w(Dolnośląskie Kujawsko-pomorskie Lubelskie Lubuskie Łódzkie Małopolskie Mazowieckie Opolskie Podkarpackie Podlaskie Pomorskie Śląskie Świętokrzyskie Warmińsko-mazurskie Wielkopolskie Zachodniopomorskie)
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: true
  validates :wojewodztwo, presence: true, inclusion: { in: WOJLIST }
  validates :new, inclusion: { in: [true, false] } 
  validates :size1, numericality: { only_integer: true }
  validates :size2, numericality: true
  
  def self.types
    %w(Rower Rama Widelec Korba Kolo Kierownica Mostek Sztyca Siodlo Inne)
  end

end