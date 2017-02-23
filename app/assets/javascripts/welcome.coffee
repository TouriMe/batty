activityId = undefined
$(document).ready ->

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
  $('#activity-modal').click (e) ->
    options = {
      animation: 'slide-in-up'
    }
    $('#tour-query-form').foundation('reveal', 'open', options)
    return
  return

