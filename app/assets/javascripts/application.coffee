#= require jquery
#= require jquery_ujs
#= require foundation
#= require jquery-ui/datepicker
#= require_tree .
#= require social-share-button
#= require froala_editor.min.js

$(()->
  $(document).foundation()
  

  $('#sign_banner > .close').click( (evt)->
    $(evt.target).parent().hide()
    localStorage.setItem("banner_check", "1")
  )
  
  if (localStorage.getItem("banner_check"))
    $('#sign_banner').hide()
)

