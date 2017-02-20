$(document).on 'ready page:load', ->
  selectTwo = ->
    id = 0
    name = "All Drivers"
    $("#tour_tour_drivers_attributes_0_driver_id").append("<option value='"+id+"' selected>"+name+"</option>")
    $('#tour_tour_drivers_attributes_0_driver_id').trigger('change')
    $('#tour_tour_drivers_attributes_0_driver_id').select2().select2('val','0')
  # selectTwo()