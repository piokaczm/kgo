// Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  $('.dropdown').on('show.bs.dropdown', function(e){
    $(this).find('.dropdown-menu').slideDown();
  });

 
  $('.dropdown').on('hide.bs.dropdown', function(e){
    $(this).find('.dropdown-menu').slideUp();
  });
});