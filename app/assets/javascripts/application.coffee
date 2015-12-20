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
#= require_tree .


$(()->
  $(document).foundation()
  
  $('#sign_banner > .close').click((evt)->
    $(evt.target).parent().hide()
    localStorage.setItem("banner_check", "1")
  )

  if (localStorage.getItem("banner_check"))
    $('#sign_banner').hide()

  $(document).bind 'DOMNodeInserted', (evt)->
    window.ReactRailsUJS.mountComponents()

  $("#startdate").datepicker({ minDate: 0 });

  $(".ellipsis").dotdotdot({
    ellipsis: '... ',
    height: 30
  });
  
  $("#bt_charge").click((e)->
    $("#payment_form").attr("action", "book?newone")  
    getInput()
    clickedChargebt()
    console.log("Clicked!")
  )

  
  $("#payment_details").validate({
    rules: {
      phone_number: {
        required: true,
        number: true
      }
    }
  });
)
