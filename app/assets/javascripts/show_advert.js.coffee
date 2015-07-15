resize_desc = (e) ->
  if $('.navbar-toggle').is(':visible') == false
    newH = $('#dane').height()
    $('#opis').height(newH)
  

$(document).ready(resize_desc)
$(window).bind('page:load', resize_desc)
$(window).resize ->
  $('#dane').css('height', 'auto')
  resize_desc
