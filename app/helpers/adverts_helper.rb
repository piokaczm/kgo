module AdvertsHelper
  
  def lista_kategorie
    %w(rowery ramy widelce korby koła kierownice mostki sztyce siodła inne)
  end
  
  def lista_kategorie_select
    return [["Proszę wybrać kategorię", nil], ["Rower", "rowery"], ['Rama', 'ramy'], ['Widelec', 'widelce'], ['Korba', 'korby'], ['Koło', 'koła'], ['Kierownica', 'kierownice'], ['Mostek', 'mostki'], ['Sztyca', 'sztyce'], ['Siodło', 'siodła'], ['Inne', 'inne']]
  end
  
  def opis_thumbnail(opis)
    opis = opis.split(" ")
    new_opis = opis[0..8]
    new_opis.join(" ")
  end
  
  def cena_format(price)
    number_to_currency(price, unit: "PLN", separator: ",", delimiter: "", format: "%n %u")
  end
  
  def tytul_format(title)
    title = title.split(" ")
    new_title = title[0..3].join(" ")
  end
  
  def sort_category
    if @adverts == Advert.where(wojewodztwo: params[:wojewodztwo]).desc
      "wojewodztwo: #{@adverts.first.wojewodztwo}"
    elsif @adverts == Advert.where(category: params[:category]).desc
      "category: #{@adverts.first.category}"
    else
      nil
    end
  end
    
  
end
