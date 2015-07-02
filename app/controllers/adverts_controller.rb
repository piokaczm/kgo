class AdvertsController < ApplicationController
  
  before_action :is_logged_in, only: [:new, :edit, :destroy]
  before_action :authorized_user, only: [:edit, :update, :destroy]
  
  def new
    @advert = Advert.new
    @user = current_user
  end

  def show
    @advert = Advert.find_by(id: params[:id])
    @user = current_user
    @mail = AdvertContact.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @advert = Advert.find_by(id: params[:id])
    @user = current_user
  end

  def index
    if Advert.exists?(category: params[:category])
      @adverts = Advert.where(category: params[:category])
      @title = "Ogłoszenia w kategorii " + @adverts.first.category
    elsif Advert.exists?(wojewodztwo: params[:wojewodztwo])
      @adverts = Advert.where(wojewodztwo: params[:wojewodztwo])
      @title = "Ogłoszenia w " + @adverts.first.wojewodztwo
    else
      flash.now[:info] = "Nie znaleziono ogłoszeń w podanej kategorii"
      @adverts = Advert.all
      @title = "Wszystkie ogłoszenia"
    end
  end

  def create
    @user = current_user
    @advert = @user.adverts.build(advert_params)
    if @advert.save
      flash[:success] = "Ogłoszenie zostało dodane"
      redirect_to @user
    else
       render 'new'
    end      
  end 

  
  def update
    @advert = Advert.find_by(id: params[:id])
    @user = current_user
    if @advert.update_attributes(advert_params)
      flash[:success] = "Ogłoszenie zostało zaaktualizowane"
      redirect_to @advert
    else
      render 'edit'
    end
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
  
  def authorized_user
    @user = current_user
    @advert = Advert.find(params[:id])
    unless @user.id == @advert.user.id || @user.admin?
        flash[:danger] = "Nie posiadasz dostępu do wskazanej strony"
        redirect_to root_path
      end

  end
  
end
