activityId = undefined
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

  redirectToTourPage = (activityId, lengthId) ->
    uri = '/tours?activity_id=' + activityId + '&length_id=' + lengthId
    window.location.href = uri
    return

  $('.activity-link').click (e) ->
    activityId = $(this).data('activity-id')
    return
  $('.length-link').click (e) ->
    lengthId = $(this).data('length-id')
    redirectToTourPage activityId, lengthId
    return
  return

