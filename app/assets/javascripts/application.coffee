#= require jquery
#= require jquery_ujs
#= require foundation
#= require_tree .
#= require social-share-button

$(()->
  $(document).foundation()

  $('#sign_banner > .close').click( (evt)->
    $(evt.target).parent().hide();
  )
)

