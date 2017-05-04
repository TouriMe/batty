Batty.DriversIndex = do ->
  _init = ->
    _displayDriverDetail()
    _detectMobile()
    _setHeightForDriverGallery()

  _detectMobile = ->
    mobile_width = 425
    if $(window).width() <= mobile_width
      return true

  _displayDriverDetail = ->
    $('.btn_driver_details').click ->
      driverId = $(@).data('id')
      $(".driver_info:not(##{driverId})").hide()
      $("##{driverId}").toggle()
      if _detectMobile()
        window.location.hash = "##{driverId}"

  _setHeightForDriverGallery = ->
    $('.btn_driver_details').click ->
      height = $('.driver_image').width()
      $('.driver_image').css('height',height)

  { init: _init}