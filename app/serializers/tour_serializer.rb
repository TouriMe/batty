class TourSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TextHelper

  has_many :images

  attributes :id, :name, :ticket_price_cents, :tuktuk_price, :car_price, :rating,
             :slug, :tour_price, :tour_img, :review

  def tour_img
    ActionController::Base.helpers.image_path object.card_img
  end

  def review
    tour_reviews = Review.where(review_type: 'tour', name: "#{object.name}").count
    pluralize(tour_reviews, 'review')
  end

  def rating
    if object.rating > 0
      object.rating
    else
      5
    end
  end

  def tour_price
    if object.ticket_price_cents != 0
      number_to_currency(object.ticket_price_cents, :precision => 0)
    elsif object.tuktuk_price.to_i != 0
      number_to_currency(object.tuktuk_price.to_i, :precision => 0)
    else
      number_to_currency(object.car_price.to_i, :precision => 0)
    end
  end
end
