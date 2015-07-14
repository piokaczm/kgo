resize_desc = (e) ->
  newH = $('#dane').height()
  $('#opis').height(newH)
  

$(document).ready(resize_desc)
$(window).bind('page:load', resize_desc)
$(window).resize ->
  $('#dane').css('height', 'auto')
  resize_desc
