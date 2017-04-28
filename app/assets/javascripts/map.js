jQuery(function() {
  return MapUI = {
    _init: function(id, pickup_lat, pickup_lng) {
      var pos = {
        lat: 13.3671, lng: 103.8448
      };

      latlng = new google.maps.LatLng(pos.lat, pos.lng);
      zoom = 16;

      var mapProp = {
        center: latlng,
        zoom: zoom,
        mapTypeId:google.maps.MapTypeId.ROADMAP
      };

      var map=new google.maps.Map(document.getElementById(id), mapProp);

      var marker = new google.maps.Marker({
        position: latlng,
        map: map,
        draggable: true
      });

      google.maps.event.trigger(map,'resize');
        if (pickup_lat == '' && pickup_lng == '') {
          get_current_location (marker);
        }else{
          marker.map.zoom = 17;
          var latitude = parseFloat(pickup_lat);
          var longitude = parseFloat(pickup_lng);
          pos = {
            lat: latitude,
            lng: longitude
          };
        };

      marker.setPosition(pos);
      map.setCenter(pos);
      google.maps.event.addListener(marker, 'dragend', function (event) {
        var lng = event.latLng.lng();
        var lat = event.latLng.lat();
        var latlng = lat + ',' + lng;
        //Front End Purchase 
        $('#latlng').val(latlng);
        //Back End New Tour
        $('#tour_tour_location').val(latlng);
        requestAddress(latlng);
      });
    }
  }
});

function get_current_location (marker) {
  var pos = {
    lat: function(val){
        return ( pos.lat= val);
    },
    lng: function(val){
        return (pos.lng= val);
    }
  };
  var zoom = 0;
  if (navigator.geolocation == true) {
    zoom = 15;
    navigator.geolocation.getCurrentPosition(function(position) {
      pos.lat(position.coords.latitude);
      pos.lng(position.coords.longitude);
      setMarker(marker, zoom, pos);
    });
  }else{
    zoom = 11;
    pos.lat(11.555606);
    pos.lng(104.874228);
    setMarker(marker, zoom, pos);
  };
}

function setMarker(marker, zoom, pos) {
  marker.map.zoom = zoom;
  marker.setPosition(pos);
  marker.map.setCenter(pos);
}

function requestAddress(latlng) {
  $.get("http://maps.googleapis.com/maps/api/geocode/json?latlng="+ latlng, function(response){
    if(response.results){
      $('#address').val(response.results[0].formatted_address);
    }else{

    }
  });
}