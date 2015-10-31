# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$( ->
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
)
