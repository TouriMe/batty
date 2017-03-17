Batty.Initializer =
  exec: (pageName) ->
    if pageName && Batty[pageName]
      Batty[pageName]['init']()

  currentPage: ->
    return '' unless $('body').attr('id')

    bodyId      = $('body').attr('id').split('-')
    action      = Batty.Util.capitalize(bodyId[1])
    controller  = Batty.Util.capitalize(bodyId[0])
    controller + action

  init: ->
    Batty.Initializer.exec('Common')
    if @currentPage()
      Batty.Initializer.exec(@currentPage())

$(document).on 'ready page:load', ->
  Batty.Initializer.init()