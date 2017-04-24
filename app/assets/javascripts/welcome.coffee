# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.coffee.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

  $('.scroll').click (event) ->
    event.preventDefault()
    $('html,body').animate { scrollTop: $(@hash).offset().top }, 1000
    return
    
  $(window).scroll ->
    if $(this).scrollTop() < 100
      $('.top-bar').fadeIn()
    else
      $('.top-bar').fadeOut()
    return


  return

