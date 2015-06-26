module AdvertsHelper
  
  def lista_kategorie
    %w(rowery ramy widelece korby koła kierownice mostki sztyce siodła inne)
  end
  
  def lista_kategorie_select
    return [["Rower", "rowery"], ['Rama', 'ramy'], ['Widelec', 'widelce'], ['Korba', 'korby'], ['Koło', 'koła'], ['Kierownica', 'kierownice'], ['Mostek', 'mostki'], ['Sztyca', 'sztyce'], ['Siodło', 'siodła'], ['Inne', 'inne']]
  end
  
end
