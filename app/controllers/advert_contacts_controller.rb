class AdvertContactsController < ApplicationController
  
  def create
    @advert = Advert.find_by(id: params[:id])
    @mail = AdvertContact.new(mail_params)
    @mail.request = request
    if @mail.deliver
      flash[:success] = "Wiadomość została wysłana"
      redirect_to @advert
    else
      flash[:danger] = "Nie udało się wysłać wiadomości"
      redirect_to @advert
    end
  end
  
  private
  
  def mail_params
    params.require(:mail).permit(:sender_email, :receiver_email, :content, :name, :nickname, :subject)
  end
  
end
