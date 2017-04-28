Batty.DriversIndex = do ->
	_init = ->
		_displayDriverDetail()

	_displayDriverDetail = ->
    $('.btn_driver_details').click ->
      driverId = $(@).data('id')
      $(".driver_info:not(##{driverId})").hide()
      $("##{driverId}").toggle()

  { init: _init}