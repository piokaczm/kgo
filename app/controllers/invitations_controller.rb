class InvitationsController < ApplicationController
  
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.create(invitation_params)
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
  
end
