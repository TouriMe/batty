Batty.PurchasesNew = do ->
  _init = ->
    _activeVisitedBreadcrumb()
    #Detail tab
    _numberOfTravellers()
    _dateTimePicker()
    _mapTimeOut()
    _nextDriverTab()
    #Driver tab
    _displayDriverDetail()
    _setHeightDriverGallery()
    _selectedDriverBtn()


  _nextDriverTab = ->
    $('#detail ul.tabs a#next').click ->
      _tourDateTime()
      _travellersAndPrice()

  _tourDateTime = ->
    tourStartDateTime = $('#datetimepicker').val()
    if tourStartDateTime == ""
      dateTime = new Date()
      month = dateTime.getMonth()
      hour = dateTime.getHours()
      minute = dateTime.getMinutes()
      tourStartDateTime = $.datepicker.formatDate("d.#{month}.yy #{hour}:#{minute}", dateTime) 

    tourDate = tourStartDateTime.split(' ')[0]
    tourTime = tourStartDateTime.split(' ')[1]
    tourDay = tourDate.split('.')[0]
    tourMonth = tourDate.split('.')[1]
    tourYear = tourDate.split('.')[2]
    stringDateTime = $.datepicker.formatDate("DD d MM yy", new Date(tourYear,tourMonth,tourDay))
    $('.tour_detail h3.start_date').text("#{stringDateTime}")
    $('#selected_pickup_time').val("#{tourTime}")
    $('#datetimepicker').val("#{stringDateTime}")

  _travellersAndPrice = ->
    travellers = $('#peopleQuanities').val()
    travellers = 1 if travellers == ""
    ticketPrice = $('#tour_ticket_price').val()
    totalPrice = parseInt(travellers) * parseInt(ticketPrice)
    $('.customer_detail h4.ticket').text("#{travellers}x Adult Tickets")
    $('.customer_expense h4.ticket_price').text("USD $#{totalPrice}")

  _setPriceToReivewTab = (transportationType)->
    #Transportation and Price
    if transportationType == 3
      transportPrice = parseInt($('#tour_tuktuk_price').val())
      type = "Tuk Tuk"
    else if transportationType == 9
      transportPrice = parseInt($('#tour_car_price').val())
      type = "Car"
    else
      transportPrice = 0
      type = "None"

    $('.customer_detail h4.transportation').text("Transportation (#{type})")
    $('.customer_expense h4.transportation_price').text("USD $#{transportPrice}")

    #Total
    travellers = $('#peopleQuanities').val()
    travellers = 1 if travellers == ""
    ticketPrice = $('#tour_ticket_price').val()
    totalPrice = parseInt(travellers) * parseInt(ticketPrice)
    total = parseInt(totalPrice) + parseInt(transportPrice)
    $('.customer_expense h4.total_price').text("USD $#{total}")
    $("#purchase_price").val("#{total}")

  _selectedDriverBtn = ->
    $('.no_selected_driver').click ->
      transportationType = $(@).data('vehicle-id')
      _setPriceToReivewTab(transportationType)
      $('#driver .section-footer ul li a#next').trigger('click')

    $('.driver_selected').click ->
      transportationType = $(@).data('vehicle-id')
      driverId = $(@).data('driver-id')
      $('#selected_driver_id').val(driverId)
      $('#selected_vehicle_type').val(transportationType)
      _setPriceToReivewTab(transportationType)
      $('#driver .section-footer ul li a#next').trigger('click')

  _setHeightDriverGallery = ->
    $('.btn_driver_details').click ->
      height = $('.driver_image').width()
      $('.driver_image').css('height',height)

  _displayDriverDetail = ->
    $('.btn_driver_details').click ->
      driverId = $(@).data('id')
      $(".driver_info:not(##{driverId})").hide()
      $("##{driverId}").toggle()

  _mapTimeOut = ->
    firstInit = false;
    $('.btn_map').click ->
      if(!firstInit)
        setTimeout (->
          MapUI._init 'map', '13.3671', '103.8448'
        ), 1000
        firstInit = true
  
  _dateTimePicker = ->
    $('#datetimepicker').datetimepicker
      format: 'd.m.Y H:i'
      inline: true
      lang: 'en'

    $('.xdsoft_today_button').mousedown()

  _activeVisitedBreadcrumb = ->
    $('.section-footer ul li a').click ->
      btnId = $(@).attr('id')
      sectionId = $(@).parents('section').attr('id')
      if btnId == 'next'
        $("#breadcrumbs li.is_active").removeClass('is_active')
        if sectionId == 'detail'
          $("#breadcrumbs li:nth-child(2)").addClass('is_active')
          $("#breadcrumbs li:nth-child(1)").addClass('visited')
        else if sectionId == 'driver'
          $("#breadcrumbs li:nth-child(3)").addClass('is_active')
          $("#breadcrumbs li:nth-child(2)").addClass('visited')
      else
        $("#breadcrumbs li.is_active").removeClass('is_active')
        if sectionId == 'driver'
          $("#breadcrumbs li:nth-child(1)").removeClass('visited')
          $("#breadcrumbs li:nth-child(1)").addClass('is_active')
        else if sectionId == 'review'
          $("#breadcrumbs li:nth-child(2)").removeClass('visited')
          $("#breadcrumbs li:nth-child(2)").addClass('is_active')


  _numberOfTravellers = -> 
    $('a.increase').click ->
      TravellersField = $('#peopleQuanities')
      numOfTravellers = parseInt(TravellersField.val()) + 1
      if isNaN(numOfTravellers)
        TravellersField.val(1)
      else
        TravellersField.val(numOfTravellers)

    $('a.decrease').click ->
      TravellersField = $('#peopleQuanities')
      numOfTravellers = parseInt(TravellersField.val()) - 1
      TravellersField.val(numOfTravellers) unless numOfTravellers < 0 or isNaN(numOfTravellers)

  { init: _init}