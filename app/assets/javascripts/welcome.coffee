# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.coffee.
# You can use CoffeeScript in this file: http://coffeescript.org/

Batty.WelcomeIndex = do ->
  _init = ->
    # _windowScroll()
    _scrollToTopBtn()
    _benefitDetail()

  _benefitDetail = ->
    $('.benefit_btn').click ->
      benefitId = $(@).attr('data-benefit-id')
      $(".benefit_detail:not(##{benefitId})").hide()
      $(".benefit_detail##{benefitId}").toggle()

  _scrollToTopBtn = ->
    $('.scroll').click (event) ->
      event.preventDefault()
      $('html,body').animate { scrollTop: $(@hash).offset().top }, 1000
    
  # _windowScroll = ->  
  #   $(window).scroll ->
  #     if $(this).scrollTop() < 100
  #       $('.top-bar').fadeIn()
  #     else
  #       $('.top-bar').fadeOut()

  { init: _init }

