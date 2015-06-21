class UsersController < ApplicationController
  
  before_action :is_logged_in, only: [:edit, :update, :index, :destroy]
  before_action :authorized_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :destroy]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def show
    if User.exists?(username: params[:username])
      @user = User.find_by(username: params[:username])
    elsif User.exists?(id: params[:id])
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_path
      flash[:danger] = "Nie można znaleźć wskazanego użytkownika"
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Dzięki za rejestrację!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profil został zaaktualizowany"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(prams[:id]).destroy
    flash[:success] = "Usunięto użytkownika"
    redirect_to users_path
  end
  
  
  private
  
    def is_logged_in
      unless logged_in?
        store_location
        flash["danger"] = "Aby wyświetlić tę stronę należy się zalogować"
        redirect_to login_path
      end
    end
  
    def authorized_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:danger] = "Nie posiadasz dostępu do wskazanej strony"
        redirect_to root_path
      end

    end
  
  
    def user_params
      params.require(:user).permit(:username, :name, :email,
        :city, :wojewodztwo, :password, :password_confirmation)
    end
  
  def admin_user
    redirect_to root_path unless current_user.admin?
  end
  
end
