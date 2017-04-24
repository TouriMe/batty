$(document).on 'ready page:load', ->
	
	$('#edit_tour #btn_map').click ->
		firstInit = false;
		$('#map_modal').css('display', 'block')
		if(!firstInit)
      setTimeout (->
        MapUI._init 'map', '13.3671', '103.8448'
      ), 1000
      firstInit = true

	$('#edit_tour #close_map_btn').click ->
		$('#map_modal').css('display', 'none')