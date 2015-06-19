class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find_by(params[:id])
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
  
  
  private
  
  
    def user_params
      params.require(:user).permit(:username, :name, :surname, :email,
        :address, :city, :zip, :password, :password_confirmation)
    end
  
end
