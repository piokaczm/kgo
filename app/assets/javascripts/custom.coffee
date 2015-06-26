jQuery ->
  text_container = $('#size1')
  $('#kategorie').change ->
    selection = $('#kategorie').val()
    if selection == 'mostki'
      text_container.text('Długość mostka')