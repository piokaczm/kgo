// Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/

var do_on_load = function() {
  $('.dropdown').click(function(e){
    $(this).find('.dropdown-menu').slideToggle();
  });
}



$(document).ready(do_on_load)
$(window).bind('page:load', do_on_load)