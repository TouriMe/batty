Batty.ToursIndex = do ->
  _init = ->
    _classActive()
    _getToursCallback()


  _getToursCallback = ->
    $('.custom-button').on 'click', (e)->
      
      activityRow = $(@).parents('.row').attr('id')

      tourType = $(e.toElement).data('tour-type')
      activityType = $(e.toElement).data('activity-type')
      
      $.ajax
        method: 'GET'
        data: { tour_type: tourType, activity_type: activityType }
        url: '/api/tours'
        success: (response) ->
          $("##{activityRow} .activity-tour .row").empty()
          tourCards = _renderTourCard(response)
          $(".container .tourpage-content ##{activityRow} .activity-tour .row").append(tourCards)

  _renderTourCard = (response) ->
    tours = response
    for tour in tours
      renderHTML = [
        "<div class='small-12 medium-6 large-4 columns'>"
          "<div class='card'>"
            "<a href='/tours/#{tour.slug}'>"
              "<div class='card-image'>"
                "<div class='card-tour-image'>"
                  "<img src='#{tour.tour_img}'>"
                  "<span class='card-title ellipsis'>"
                    "#{tour.name}" 
                  "</span>"
                  "<span class='card-tour-price'>"
                    "#{tour.tour_price}" 
                  "</span>"
                "</div>"
              "</div>"
            '</a>'
            "<div class='card-action'>"
              "<div class='rating'>"
                "#{ _rating(tour.rating) }"
              "</div>"
              "<div class='review-num'>"
                "<strong>"
                  "#{tour.review}"
                "</strong>"
              "</div>"
            "</div>"
          "</div>"
        "</div>"
      ].join('')

  _rating = (rate_counts) ->
    fiveStars = ''
    fullStars = ''
    noStars = ''
    halfStars = ''

    rates = parseInt(rate_counts * 2)
    
    for [1..(rates/2)]
      fullStars += "<i class='fa fa-star'></i>"
    if rates % 2 == 1
      halfStars = "<i class='fa fa-star-half-o'></i>"
    if rates != 10
      for [1..((10 - rates)/ 2)]
        noStars += "<i class='fa fa-star-o'></i>"

    fiveStars = fullStars + halfStars + noStars

  _classActive = ->
    # tourpage_content_children = $('.tourpage-content').children()
    # tourpage_content_children.each ->
    #   activity_type = $(@).children('.activity-type')
    #   filter = activity_type.find('.activity-type-filter')
    #   $(filter).click ->
    #     id = $(@).attr("id")
    #     filter.removeClass('is_active')
    #     $(@).addClass('is_active')
        
    $('.custom-button').click ->
      parent = $(@).parents('.row').attr('id')
      $("##{parent} .activity-type .activity-type-filter .custom-button.is_active").removeClass('is_active')
      $(@).addClass('is_active')



  { init: _init }
