module ApplicationHelper
  
  def title(text=0)
    base = "KaGieO"
    if text.empty?
      base + ' | Koleżeńska Giełda Ostrokołowa'
    else
      text + ' | ' + base
    end
  end
      
end
