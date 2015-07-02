// Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/

var do_on_load = function() {
  
  $('body').waitForImages(function() {
      maxH = 0;
    $('.thumb-advert').each(function() {
      if ($(this).height() > maxH) {
        maxH = $(this).height();
      }
    });

    $('.thumb-advert').each(function() {
      $(this).height(maxH);
    });
  });
  
  
  if ($('.navbar-toggle').is(':visible') == false) {
    
    $('.dropdown').on('show.bs.dropdown', function(e){
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
        });

      // ADD SLIDEUP ANIMATION TO DROPDOWN //
      $('.dropdown').on('hide.bs.dropdown', function(e){
        $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
        });

    };
};
  

$.fn.resize_thumb = function(element) {
  maxH = 0;
  $(element).each(function() {
    if ($(this).height() > maxH) {
      maxH = $(this).height();
    }
  });
  $(element).each(function() {
    $(this).height(maxH);
  });
};



$(document).ready(do_on_load);
$(window).bind('page:load', do_on_load);
$(window).resize(function () {
  $('.thumb-advert').css('height', 'auto');
  $.fn.resize_thumb('.thumb-advert');
});