class SessionController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:username]) || User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      
    else
      flash.now[:danger] = "Nie ma takiego użytkownika"
      render 'new'
      end
  end
  
  def destroy
  end
  
end
