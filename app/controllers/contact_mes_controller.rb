class ContactMesController < ApplicationController
  
  def create
    @contact = ContactMe.new(contact_params)
    if @contact.valid?
      UserMailer.contact_me(@contact).deliver
      flash[:success] = "Wiadomość została wysłana"
      redirect_to :back
    else
      flash[:danger] = "Nie udało się wysłać wiadomości"
      redirect_to :back
    end
  end
    

  
  private
  
  def contact_params
    params.require(:contact_me).permit(:name, :subject, :email, :content)
  end
end
