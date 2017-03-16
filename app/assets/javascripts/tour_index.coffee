Batty.ToursIndex = do ->
  _init = ->
    _classActive()
  #   _getToursCallback()


  # _getToursCallback = ->
  #   $('button.btn-sort-tour').on 'click', (element)->
  #     tourType = $(element).data('tour-type')

  #     $.ajax:
  #       method: 'GET'
  #       data: tourType
  #       url: 'tours/'
  #       success: (response) ->
          
  #     .button{data-tour-type => 'full-day'} =full-day

  _classActive = ->
    # tourpage_content_children = $('.tourpage-content').children()
    # tourpage_content_children.each ->
    #   activity_type = $(@).children('.activity-type')
    #   filter = activity_type.find('.activity-type-filter')
    #   $(filter).click ->
    #     id = $(@).attr("id")
    #     filter.removeClass('is_active')
    #     $(@).addClass('is_active')
        
    $('.activity-type-filter').click ->
      parent = $(@).parents('.row').attr('id')
      $("##{parent}>.activity-type>.activity-type-filter.is_active").removeClass('is_active')
      $(@).addClass('is_active')



  { init: _init }
