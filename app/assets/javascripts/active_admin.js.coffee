#= require active_admin/base
#= require ckeditor/init
#= require underscore
#= require gmaps/google

$(document).on 'ready page:load', ->
  #  $('.wysiwyg-edit-field').froalaEditor()
  mapUI = (id,latlng)->

    poslat = latlng.split(',')[0]
    poslng = latlng.split(',')[1]

    pos = { lat: poslat, lng: poslng }
    
    latlng = new google.maps.LatLng(pos.lat, pos.lng)
     
    zoom = 17

    mapProp = {
      center: latlng,
      zoom: zoom,
      mapTypeId:google.maps.MapTypeId.ROADMAP
    }

    map = new google.maps.Map(document.getElementById(id), mapProp)

    marker = new google.maps.Marker({
      position: latlng,
      map: map
    });

  latlng = $('#map').data('latlng') 
  mapUI('map',latlng)

