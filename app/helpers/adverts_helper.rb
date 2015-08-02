module AdvertsHelper
  
  def lista_kategorie
    %w(rowery ramy widelce korby koła kierownice mostki sztyce siodła inne)
  end
  
  def lista_kategorie_select
    return [["Proszę wybrać kategorię", nil], ["Rower", "rowery"], ['Rama', 'ramy'], ['Widelec', 'widelce'], ['Korba', 'korby'], ['Koło', 'koła'], ['Kierownica', 'kierownice'], ['Mostek', 'mostki'], ['Sztyca', 'sztyce'], ['Siodło', 'siodła'], ['Inne', 'inne']]
  end
  
  def lista_rozmiar
    [['rowery', "Podsiodłowa", 'cm',  'Długość', 'cm'], ['ramy', 'Podsiodłowa', 'cm', 'Długość', 'cm'], ['widelce', 'Rura sterowa', 'cm', 'Średnica', '"'], ['korby', 'Ramię', 'cm'], ['koła', 'Rozmiar', '"'], ['kierownice', 'Szerokość', 'cm', 'Mocowanie', 'mm'], ['mostki', 'Długość', 'mm', 'Mocowanie', 'mm'], ['sztyce', 'Długość', 'cm', 'Średnica', 'mm'], ['siodła'], ['inne']]
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
  
  def parse_zeros(attr)
    if attr == attr.to_i
      attr.to_i
    else
      attr
    end
  end
  
end