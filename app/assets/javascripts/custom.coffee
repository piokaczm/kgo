jQuery ->
  text_container1 = $('#size1')
  text_container2 = $('#size2')
  jednostka1 = $('#jednostka1')
  jednostka2 = $('#jednostka2')
  $('#kategorie').change ->
    selection = $('#kategorie').val()
    if selection = 'rowery'
      text_container1.text("Rura podsiodłowa")
      jednostka1.text("cm")
      text_container2.text("Długość ramy")
      jednostka2.text("cm")
    else if selection = 'ramy'
      text_container1.text("Rura podsiodłowa")
      jednostka1.text("mm")
      text_container2.text("Długość ramy")
      jednostka2.text("cm")
    else if selection == 'widelce'
      text_container1.text("Rura sterowa")
      jednostka1.text("cm")
      text_container2.text("Pod główkę")
      jednostka2.text("cal")
    else if selection == 'mostki'
      text_container1.text('Długość mostka')