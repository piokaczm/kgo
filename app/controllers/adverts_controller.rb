class AdvertsController < ApplicationController
  def new
  end

  def show
  end

  def edit
  end

  def index
    if Advert.exists?(category: params[:category])
      @adverts = Advert.where(category: params[:category])
    elsif Advert.exists?(wojewodztwo: params[:wojewodztwo])
      @adverts = Advert.where(wojewodztwo: params[:wojewodztwo])
    else
      @adverts = Advert.all
    end
  end

  def create
  end  
  
  
  
  private
  

   
end
