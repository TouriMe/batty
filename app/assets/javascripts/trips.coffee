# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$( ->
  $(window).scroll( ->
    contentOffset = $('#detail-content').offset().top
    fixheadHeight = $('#fixed-head').height()
    console.log(contentOffset - $(window).scrollTop())
    if $(window).scrollTop() >= contentOffset
      $('#payment').css("top",fixheadHeight)
    else
      $('#payment').css("top",contentOffset-$(window).scrollTop())

  )
)
