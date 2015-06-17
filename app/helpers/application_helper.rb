module ApplicationHelper
  
  def title(text=0)
    base = "KGO"
    if text.empty?
      base + ' | Koleżeńska Giełda Ostrokołowa'
    else
      text + ' | ' + base
    end
  end
    
  
end
