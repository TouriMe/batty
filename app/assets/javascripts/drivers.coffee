# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.coffee.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$( ->
  $imgUrl = $('.hero-background').attr("data-img");
  $('.hero-background').attr('style','background-image:url('+ $imgUrl + ')');
)


