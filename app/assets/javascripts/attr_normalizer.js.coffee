normalize_input = ->
  $('form').submit ->
    normalized_price = $('#advert_price').val().replace(',', '.')
    normalized_size2 = $('#size2input').val().replace(',', '.')
    normalized_size1 = $('#size1input').val().replace(',', '.')
    $('#advert_price').val(normalized_price)
    $('#size2input').val(normalized_size2)
    $('#size1input').val(normalized_size1)
    
$(document).ready(normalize_input)
$(window).bind('page:load', normalize_input) 