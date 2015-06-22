class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:username]) || User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in(user)
        flash[:success] = "Jesteś zalogowany jako #{user.username}!"
        redirect_back_or user        
      else
        message = "Konto nie zotało aktywowane"
        message += "Kliknij link z wiadomości wysłanej na Twój e-mail"
        flash[:warning] = message
        redirect_to root_path
      end
    else
      flash.now[:danger] = "Nie ma takiego użytkownika"
      render 'new'
      end
  end
  
  def destroy
    log_out
    redirect_to root_path
    flash[:info] = "Zostałeś wylogowany"
  end
  
end
