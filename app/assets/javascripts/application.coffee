#= require jquery
#= require jquery_ujs
#= require foundation
#= require jquery-ui/datepicker
#= require social-share-button
#= require froala_editor.min.js
#= require react
#= require react_ujs
#= require components
#= require jquery.dotdotdot
#= require jquery.infinitescroll
#= require jquery.infinite-pages
#= require underscore
#= require gmaps/google
#= require active_admin/base
#= require ckeditor/init
#= require map

#= require wow.min.js
#= require scrollreveal.min.js
#= require jquery.datetimepicker.full.min

#= require namespace
#= require util

#= require welcome
#= require tour/index
#= require tour/show
#= require purchase/new
#= require driver/index
#= require driver/show

#= require initializer



$(()->
  $(document).foundation()
  wow = new WOW
  wow.init()

  $('#sign_banner > .close').click((evt)->
    $(evt.target).parent().hide()
    localStorage.setItem("banner_check", "1")
  )

  # Configure infinite table
  $('#drivers-selection').infinitePages
# debug: true
    buffer: -200
    loading: ->
      $(this).text('Loading more drivers...')
    error: ->
      $(this).button('There was an error, please try again')

  if (localStorage.getItem("banner_check"))
    $('#sign_banner').hide()

  $(document).bind 'DOMNodeInserted', (evt)->
    window.ReactRailsUJS.mountComponents()

  $("#startdate").datepicker({minDate: 0, dateFormat: 'D, dd M yy'});

  $(".ellipsis").dotdotdot({
    ellipsis: '... ',
    height: 30
  });

  $("#title-text").dotdotdot({
    ellipsis: '... ',
    height: 40
  });

  deviceHeight = $(window).height()
  footerHeight = $('#footer').height()
  containerHeight = $('.main-container').height()
  if containerHeight <= deviceHeight
    footerPosition = deviceHeight - containerHeight - footerHeight
    if footerPosition > 0
      $('#footer').css('margin-top', footerPosition+'px');

  $('.login-logout-btn').click ->
    $('#loginModal').foundation('reveal', 'open'); 
#  $("#payment_details").validate({
#    rules: {
#      phone_number: {
#        required: true,
#        number: true
#      }
#    }
#  });
)
