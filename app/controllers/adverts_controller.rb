class AdvertsController < ApplicationController
  
  has_scope :price, type: :boolean
  has_scope :price_desc, type: :boolean
  has_scope :size, type: :boolean
  has_scope :size_desc, type: :boolean
  
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
    sort_list = ['price', 'price_desc', 'size', 'size_desc']
    if Advert.exists?(wojewodztwo: params[:wojewodztwo])      
      @adverts = apply_scopes(Advert).where(wojewodztwo: params[:wojewodztwo]).page(params[:page]).per_page(18) if (params.keys & sort_list).any?
      @adverts = Advert.where(wojewodztwo: params[:wojewodztwo]).desc.page(params[:page]).per_page(18) if !(params.keys & sort_list).any?
      @sort_type = 'wojewodztwo'
      @title = "Ogłoszenia w " + @adverts.first.wojewodztwo
    elsif Advert.exists?(category: params[:category])      
      @adverts = apply_scopes(Advert).where(category: params[:category]).page(params[:page]).per_page(18) if (params.keys & sort_list).any?
      @adverts = Advert.where(category: params[:category]).desc.page(params[:page]).per_page(18) if !(params.keys & sort_list).any?
      @sort_type = 'category'
      @title = "Ogłoszenia w kategorii " + @adverts.first.category
    elsif params[:wojewodztwo].blank? && params[:category].blank?
      @adverts = apply_scopes(Advert).all.desc.page(params[:page]).per_page(18)
      @title = "Wszystkie ogłoszenia"
    else
      flash.now[:info] = "Nie znaleziono ogłoszeń w podanej kategorii"
      @adverts = apply_scopes(Advert).all.desc.page(params[:page]).per_page(18)
      @title = "Wszystkie ogłoszenia"
    end
  end

  def create
    @user = current_user
    @advert = @user.adverts.new(advert_params)
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
    params.require(:advert).permit(:title, :content, :price, :wojewodztwo, :new, :size1, :size2, :city, :category, :picture, :user_id, :fb_link, :gallery_link)
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
