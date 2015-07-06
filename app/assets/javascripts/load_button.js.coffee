load_button = ->
  btn = $('.btn-send')
  container = $('.send-container')
  
  $('form').submit ->
    btn.css('visibility', 'hidden')
    container.html('<i class="fa fa-spinner fa-pulse fa-2x"></i>')
    container.addClass('center')
  $(window).on 'bind', 'page:change', ->
    container.html('')
    btn.css('display', 'initial')
    
$(document).ready(load_button)
$(window).bind('page:load', load_button)