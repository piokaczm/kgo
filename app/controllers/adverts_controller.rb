class AdvertsController < ApplicationController
  
  before_action :is_logged_in, only: [:new, :edit, :destroy]
  
  def new
    @advert = Advert.new
    @user = current_user
  end

  def show
    @advert = Advert.find_by(id: params[:id])
  end

  def edit
  end

  def index
    if Advert.exists?(category: params[:category])
      @adverts = Advert.where(category: params[:category])
      @title = "Ogłoszenia w kategorii " + @adverts.first.category
    elsif Advert.exists?(wojewodztwo: params[:wojewodztwo])
      @adverts = Advert.where(wojewodztwo: params[:wojewodztwo])
      @title = "Ogłoszenia w " + @adverts.first.wojewodztwo
    else
      @adverts = Advert.all
      @title = "Wszystkie ogłoszenia"
    end
  end

  def create
    @user = current_user
    @advert = @user.adverts.build(advert_params)
    if @advert.valid?
      if !@advert.picture.nil?
        @advert.save
        flash[:success] = "Ogłoszenie zostało dodane"
        redirect_to @user
      else
        flash.now[:danger] = "Proszę dołączyć zdjęcie"
        render 'new'
      end
    else
       render 'new'
    end      
  end 

  
  def update
  end
  
  def destroy
    Advert.find(params[:id]).destroy
    flash[:success] = "Usunięto ogłoszenie"
    redirect_to root_path
  end
  
  private
  
  def advert_params
    params.require(:advert).permit(:title, :content, :price, :wojewodztwo, :new, :size1, :size2, :city, :category, :picture)
  end

  
   def is_logged_in
      unless logged_in?
        store_location
        flash["danger"] = "Aby wyświetlić tę stronę należy się zalogować"
        redirect_to login_path
      end
    end
  
end
