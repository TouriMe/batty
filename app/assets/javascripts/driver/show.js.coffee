Batty.DriversShow = do -> 
  _init = ->
    _heroHeaderSection()
    _checkForUserLogin()
    _revealLoginModal()
    _tourRateBtn()
    _acitveReviewBtn()

  _checkForUserLogin = ->
    url = window.location.href
    if url.match(/\_\=\_/i)
      $('.review_btn').hide()
      $('.review_form').show()
      window.location.hash = "#reviews"
    else
      $('.review_btn').show()
      $('.review_form').hide()
      window.location.hash = "#wrapper"

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

  _heroHeaderSection = ->
    $driverImgUrl      = $('.profile-page-hero').attr("data-img")
    driverHeaderHeight = $('.profile-head').height()
    driverHeroHight    = $(window).height() - driverHeaderHeight

    $('.profile-page-hero').attr('style',' background-image:url('+ $driverImgUrl + ');height:' + driverHeroHight + 'px;')
    $('.profile-page-hero').attr('style',' background-image:url('+ $driverImgUrl + ');height:' + driverHeroHight + 'px;')
    $('.hero-content').attr('style', 'height:' + driverHeroHight + 'px;')
    $('.profile-page-hero').attr('style', 'height:' + driverHeroHight + 'px;')

  { init: _init }
