# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $j 'input[type="radio"][name="category_rower"]'.prop("checked", true) ->
    $j '#main_form'.load( '<%= render "rower" %>' )