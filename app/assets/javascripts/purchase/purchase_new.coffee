Batty.PurchasesNew = do ->
  _init = ->
    _activeVisitedBreadcrumb()
    _numberOfTravellers()

  _activeVisitedBreadcrumb = ->
    $('.section-footer ul li a').click ->
      btnId = $(@).attr('id')
      sectionId = $(@).parents('section').attr('id')
      if btnId == 'next'
        $("#breadcrumbs li.is_active").removeClass('is_active')
        if sectionId == 'detail'
          $("#breadcrumbs li:nth-child(2)").addClass('is_active')
          $("#breadcrumbs li:nth-child(1)").addClass('visited')
        else if sectionId == 'driver'
          $("#breadcrumbs li:nth-child(3)").addClass('is_active')
          $("#breadcrumbs li:nth-child(2)").addClass('visited')
      else
        $("#breadcrumbs li.is_active").removeClass('is_active')
        if sectionId == 'driver'
          $("#breadcrumbs li:nth-child(1)").removeClass('visited')
          $("#breadcrumbs li:nth-child(1)").addClass('is_active')
        else if sectionId == 'review'
          $("#breadcrumbs li:nth-child(2)").removeClass('visited')
          $("#breadcrumbs li:nth-child(2)").addClass('is_active')


  _numberOfTravellers = -> 
    $('a.increase').click ->
      TravellersField = $('#peopleQuanities')
      numOfTravellers = parseInt(TravellersField.val()) + 1
      if isNaN(numOfTravellers)
        TravellersField.val(1)
      else
        TravellersField.val(numOfTravellers)

    $('a.decrease').click ->
      TravellersField = $('#peopleQuanities')
      numOfTravellers = parseInt(TravellersField.val()) - 1
      TravellersField.val(numOfTravellers) unless numOfTravellers < 0 or isNaN(numOfTravellers)

  { init: _init}