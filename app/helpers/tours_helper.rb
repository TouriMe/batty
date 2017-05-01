module ToursHelper
	def latlng?(latlng)
		latlng.present? ? latlng : "13.3671,103.8448"
	end

	def number_of_reviews(tour)
		tour_reviews = Review.where(review_type: 'tour', name: "#{tour.name}").count
	end
end
