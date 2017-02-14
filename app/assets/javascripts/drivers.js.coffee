Batty.DriversShow = do -> 
  _init = ->
    _heroHeaderSection()

  _heroHeaderSection = ->
    $driverImgUrl      = $('.hero-background').attr("data-img")
    driverHeaderHeight = $('.profile-head').height()
    driverHeroHight    = $(window).height() - driverHeaderHeight

    $('.hero-background').attr('style',' background-image:url('+ $driverImgUrl + ');height:' + driverHeroHight + 'px;')
    $('.hero-content').attr('style', 'height:' + driverHeroHight + 'px;')
    $('.profile-page-hero').attr('style', 'height:' + driverHeroHight + 'px;')

  { init: _init }
