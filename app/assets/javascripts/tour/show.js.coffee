
Batty.ToursShow = do ->
  _init = ->
    _tourHeaderSection()
    _heroUnitSlider()
    _tourContentSection()
    _tourLocation()
    _acitveReviewBtn()
    _tourRateBtn()
    _revealLoginModal()
    _checkForUserLogin()
    # $modal = $('#fill-purchase-info-modal')
    # $eles = $('.book-tour-via-driver')
    # $eles.click( (evt)->
    #   evt.preventDefault()
    #   $target = $(evt.target)
    #   $modal.find('#purchase_driver_id').val($target.data('driver-id'))
    #   window.ttt = $target
    #   vehicle = $target.data('vehicle')
    #   $modal.find('#purchase_vehicle_id').val(vehicle['id'])
    #   $modal.find('.booking_info .driver-name').html($target.data('driver-name'))
    #   $modal.find('.booking_info .vehicle-type').html(vehicle.name)
    #   $modal.find('.pic-section').attr('style','background-image:url('+ $target.data('driver-img-url') + ')')
    #   #$modal.find('.pic-section img.avatar').attr('src', $target.data('driver-img-url'))
    #   $modal.find('.price').html($target.data('price').to_s)

    #   $modal.foundation('reveal', 'open')
    # )
  _checkForUserLogin = ->
    url = window.location.href
    if url.match(/\_\=\_/i) || url.match(/\#/i) 
      $('.review_btn').hide()
      $('.review_form').show()
      window.location.hash = "#reviews"
    else
      $('.review_btn').show()
      $('.review_form').hide()

  _revealLoginModal = ->
    $('.review_btn').click ->
      $('#loginModal').foundation('reveal','open')
      logInBtnText = $('.login-logout-btn').text()
      unless logInBtnText == "  Log In/Sign Up"
        $('.review_form').show()
        $(@).hide()


  _tourRateBtn = ->
    $('.tour_rate i').click ->
      rate = parseInt($(@).attr('data-star-id'))
      $('#stars').val(rate)
      for i in [rate+1..5]
        $(".tour_rate i##{i}").removeClass('rated')
      for i in [1..rate]
        $(".tour_rate i##{i}").addClass('rated')

  _acitveReviewBtn = ->
    $('.order_by_date_btn').click ->
      $('.order_by_star_btn').removeClass('is_active')
      $('.order_by_date_btn').addClass('is_active')
      $('.review_by_date').show()
      $('.review_by_star').hide()

    $('.order_by_star_btn').click ->
      $('.order_by_date_btn').removeClass('is_active')
      $('.order_by_star_btn').addClass('is_active')
      $('.review_by_star').show()
      $('.review_by_date').hide()

  _tourLocation = () ->
    latlng = $('#map').data('latlng')
    if latlng?
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

      map = new google.maps.Map(document.getElementById("map"), mapProp)

      marker = new google.maps.Marker({
        position: latlng,
        map: map
      });

  _tourHeaderSection = ->  
    $imgUrl = $('.trip-cover-img').attr("data-img")
    # headerHeight = $('#fixed-head').height()
    # tripHeaderHeight = $('.trip_head_wrapper').height()
    # heroHight = $(window).height()-tripHeaderHeight + 80
    $('.trip-cover-img').attr('style',' background-image:url('+ $imgUrl + ');');
    $('.trip-cover-img').attr('style',' background-color:grey;');
    $('.trip-cover-img').click( (evt)->
      $('.carousel ul li:first-child img').click();
    );

#  $driverImages = $('.driver-gallery .thumb-nail');
#  for img in $driverImages
#    $imgUrl = img.getAttribute("data-img")
#    img.setAttribute('style','background-image:url('+ $imgUrl + ');height:300px;width:300px;margin:10px 5px;')
#
##    img.className += "thumb-img"
#
#  $('.thumb-nail').click( (evt)->
#    $('.carousel ul li:first-child img').click();
#  );

    if ($('#detail-content').length == 0 || $('#payment-form').length == 0)
      return

    $(window).scroll( ->
      contentOffset = $('#detail-content').offset().top
      fixheadHeight = $('#fixed-head').height()
      if $(window).scrollTop() >= contentOffset - fixheadHeight
        $('#payment-form').css("top",fixheadHeight)
      else
        $('#payment-form').css("top",contentOffset-$(window).scrollTop())
    )

    $('.book-tour-via-driver').each (idx, ele) ->
      $ele = $(ele)
      $ele.click( (evt) ->
        driver_id = $ele.data('driver_id')
      )

  _tourContentSection = ->
    padding = 21
    scheduleHeight = $('.schedule').height()
    if scheduleHeight >= 280
      imageHeight = scheduleHeight + padding
      image = '.gallery .tour_gallery-orbit .tour-image'
      # $(".gallery").css('height', scheduleHeight)
      $("#{image}").css('height', imageHeight)

  _heroUnitSlider = ->
    $(document).foundation({
        orbit: {
          animation: 'slide',
          timer_speed: 5000,
          timer: false,
          swipe: true,
          pause_on_hover: true,
          animation_speed: 500,
          navigation_arrows: true,
          bullets: false,
          slide_number: false
        }
    });
  
  { init : _init}

