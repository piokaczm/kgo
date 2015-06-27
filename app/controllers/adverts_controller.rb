class AdvertsController < ApplicationController
  
  before_action :is_logged_in, only: [:new, :edit]
  
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
    elsif Advert.exists?(wojewodztwo: params[:wojewodztwo])
      @adverts = Advert.where(wojewodztwo: params[:wojewodztwo])
    else
      @adverts = Advert.all
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
  end
  
  private
  
  def advert_params
    params.require(:advert).permit(:title, :content, :price, :wojewodztwo, :new, :size1, :size2, :city, :category, :picture_id)
  end

  
   def is_logged_in
      unless logged_in?
        store_location
        flash["danger"] = "Aby wyświetlić tę stronę należy się zalogować"
        redirect_to login_path
      end
    end
  
end
