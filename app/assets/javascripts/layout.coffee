hide_modal = ->
  imgModal = $('#imageModal')
  imgModal.on 'shown.bs.modal', (e) ->
    imgModal.click ->
      imgModal.modal('hide')


$(document).ready(hide_modal)
$(window).bind('page:change', hide_modal)
