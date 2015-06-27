formChanger = ->
  text_container1 = $('#size1')
  text_container2 = $('#size2')
  jednostka1 = $('#jednostka1')
  jednostka2 = $('#jednostka2')
  input = $('#size2input')
  input1 = $('#size1input')
  $('#kategorie').change ->
    selection = $('#kategorie').val()
    
    if selection == 'rowery'
      text_container1.text("Rura podsiodłowa")
      jednostka1.text("cm")
      text_container2.text("Długość ramy")
      jednostka2.text("cm")
      input.prop('disabled', false)
      input1.prop('disabled', false)
      
    else if selection == 'ramy'
      text_container1.text("Rura podsiodłowa")
      jednostka1.text("mm")
      text_container2.text("Długość ramy")
      jednostka2.text("cm")
      input.prop('disabled', false)
      input1.prop('disabled', false)
      
    else if selection == 'widelce'
      text_container1.text("Rura sterowa")
      jednostka1.text("cm")
      text_container2.text("Średnica")
      jednostka2.text("cal")
      input.prop('disabled', false)
      input1.prop('disabled', false)
      
    else if selection == 'korby'
      text_container1.text("Długość ramienia")
      jednostka1.text("mm")
      text_container2.text("-")
      input.prop('disabled', true)
      input1.prop('disabled', false)
      
    else if selection == "koła"
      text_container1.text("Rozmiar")
      jednostka1.text('cali')
      text_container2.text('-')
      input.prop('disabled', true)
      input1.prop('disabled', false)
      
    else if selection == "kierownice"
      text_container1.text('Szerokość')
      jednostka1.text("cm")
      text_container2.text("Średnica mocowania")
      jednostka2.text("mm")
      input.prop('disabled', false)
      input1.prop('disabled', false)
      
    else if selection == 'mostki'
      text_container1.text('Długość mostka')
      jednostka1.text('mm')
      text_container2.text('Średnica mocowania')
      jednostka2.text('mm')
      input.prop('disabled', false)
      input1.prop('disabled', false)
      
    else if selection == 'sztyce'
      text_container1.text('Długość')
      jednostka1.text('cm')
      text_container2.text('Średnica')
      jednostka2.text('mm')
      input.prop('disabled', false)
      input1.prop('disabled', false)
      
    else
      text_container1.text("-")
      text_container2.text("-")
      input.prop('disabled', true)
      input1.prop('disabled', true)
      
$(window).bind('page:change', formChanger)