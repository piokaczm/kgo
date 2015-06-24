class AdvertsController < ApplicationController
  
  before_action :advert_type, only: [:index]
  def new
  end

  def show
  end

  def edit
  end

  def index
    @adverts = type_class.all
  end

  def create
  end  
  
  
  
  private
  
  
  def advert_type
    @type = type
  end
  
  def type
    Advert.types.include?(params[:type]) ? params[:type] : "Advert"
  end
  
  def type_class
    type.constantize
  end
   
end
