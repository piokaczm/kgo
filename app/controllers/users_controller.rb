class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def show
    if User.exists?(username: params[:username])
      @user = User.find_by(username: params[:username])
    elsif User.exists?(id: params[:id])
      @user = User.find_by(params[:id])
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
  
  
  private
  
  
    def user_params
      params.require(:user).permit(:username, :name, :email,
        :city, :password, :password_confirmation)
    end
  
end
