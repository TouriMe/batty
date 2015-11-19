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

  $('.book-tour-via-driver').each (idx, ele) ->
    $ele = $(ele)
    $ele.click( (evt) ->
      driver_id = $ele.data('driver_id')
    )

)


$(document).foundation({
    orbit: {
      animation: 'slide',
      timer_speed: 5000,
      timer: false,
      swipe: true,
      pause_on_hover: true,
      animation_speed: 500,
      navigation_arrows: true,
      bullets: false,
      slide_number: false
    }
});


$( ->
  $modal = $('#fill-purchase-info-modal')
  $eles = $('.book-tour-via-driver')
  $eles.click( (evt)->
    evt.preventDefault()
    $target = $(evt.target)
    $modal.find('#purchase_driver_id').val($target.data('driver-id'))
    window.ttt = $target
    vehicle = $target.data('vehicle')
    $modal.find('#purchase_vehicle_id').val(vehicle['id'])
    $modal.find('.booking_info .driver-name').html($target.data('driver-name'))
    $modal.find('.booking_info .vehicle-type').html(vehicle.name)
    $modal.find('.pic-section').attr('style','background-image:url('+ $target.data('driver-img-url') + ')')
    #$modal.find('.pic-section img.avatar').attr('src', $target.data('driver-img-url'))
    $modal.find('.price').html($target.data('price').to_s)

    $modal.foundation('reveal', 'open')
  )
)
