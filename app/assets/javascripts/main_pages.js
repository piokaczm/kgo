// Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/

var do_on_load = function() {
  $('.dropdown').click(function(e){
    $(this).find('.dropdown-menu').slideToggle();
    e.stopPropagation();
  });
  
  $(document).click(function() {
    $('.dropdown-menu').slideUp();
  });
  
  
  maxH = 0;
  $('.thumb-advert').each(function() {
    if ($(this).height() > maxH) {
      maxH = $(this).height();
    }
  });
  
  $('.thumb-advert').each(function() {
    $(this).height(maxH);
  });
  
};



$(document).ready(do_on_load);
$(window).bind('page:load', do_on_load);