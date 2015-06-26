# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

changeLabel = ->  
  container = $('#size1')
  selection = $('#kategorie').val()
  if selection == 'mostki'
    container.text('Długość mostka')

$ ->
  $(document).on 'change', '#kategorie', changeLabel