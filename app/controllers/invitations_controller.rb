class InvitationsController < ApplicationController
  
  before_action :is_logged_in
  
  def new
    @invitation = Invitation.new
    @user = current_user
  end
  
  def create
    @invitation = Invitation.create(invitation_params)
    @user = current_user
    if @invitation.save
      @invitation.user.invitations_left -= 1
      flash.now[:success] = "Zaproszenie zostało wysłane"
      render 'new'
    else
      flash.now[:danger] = "Nie udało się wysłać zaproszenia"
      render 'new'
    end
  end
  
  private
  
  def invitation_params
    params.require(:invitation).permit(:user_id, :email)
  end
  
  def is_logged_in
      unless logged_in?
        store_location
        flash["danger"] = "Aby wyświetlić tę stronę należy się zalogować"
        redirect_to login_path
      end
    end  
  
end
