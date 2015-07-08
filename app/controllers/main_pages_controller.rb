class MainPagesController < ApplicationController
  
  def home
    @adverts = Advert.all.order("id desc").limit(6)
  end

  def help
  end

  def about
  end

  def contact
    @contact = ContactMe.new
  end
  
  def terms
  end
  
end

 