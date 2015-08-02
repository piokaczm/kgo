class Advert < ActiveRecord::Base
  include ActiveModel::Validations::Callbacks
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  
  
  attr_accessor :image_width, :image_height
  mount_uploader :picture, AdvertPhotoUploader  
  belongs_to :user  
  
  scope :desc, -> { order(created_at: :desc) }  
  scope :price, -> { order(price: :asc) }
  scope :price_desc, -> { order(price: :desc) }
  scope :size, -> { order(size1: :asc) }
  scope :size_desc, -> { order(size1: :desc) }
  
  
  WOJLIST = %w(Dolnośląskie Kujawsko-pomorskie Lubelskie Lubuskie Łódzkie Małopolskie Mazowieckie Opolskie Podkarpackie Podlaskie Pomorskie Śląskie Świętokrzyskie Warmińsko-mazurskie Wielkopolskie Zachodniopomorskie)
  TYPELIST = %w(rowery ramy widelce korby koła kierownice mostki sztyce siodła inne)
  
  validates :picture, presence: true
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 150 }
  validate  :dont_be_stupid
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: true
  validates :wojewodztwo, presence: true, inclusion: { in: WOJLIST }
  validates :new, inclusion: { in: [true, false] } 
  validates :size1, numericality: true, :unless => :not_require_both_sizes?
  validates :size2, numericality: true, :unless => :not_require_size2?
  validates :city, presence: true
  validates :category, presence: true, inclusion: { in: TYPELIST }

  
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
  
  def dont_be_stupid
    title = self.title.split(" ")
    content = self.content.split(" ")
    words = title + content
    words.each do |word|
      if word.length > 16 && !word.include?('www')
        errors.add(:base, "Wprowadzono za długie słowo")
        return false
      else
        true
      end
    end
  end
  
end
