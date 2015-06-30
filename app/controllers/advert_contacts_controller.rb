class AdvertContactsController < ApplicationController
  
  
  
  def create    
    @advert = Advert.find_by(id: params[:id])
    @mail = AdvertContact.new(mail_params)
    if @mail.valid?
      UserMailer.contact_form(@mail).deliver
      flash[:success] = "Wiadomość została wysłana"
      redirect_to :back
    else
      flash[:danger] = "Nie udało się wysłać wiadomości"
      redirect_to :back
    end
  end
  
  private
  
  def mail_params
    params.require(:advert_contact).permit(:sender_email, :receiver_email, :content, :name, :subject)
  end
  
end
