module ToursHelper
	def latlng?(latlng)
		latlng.present? ? latlng : "13.3671,103.8448"
	end

	def number_of_reviews(tour)
		tour_reviews = Review.where(review_type: 'tour', name: "#{tour.name}").count
	end

	def number_of_tour_type(activity)
		tour_type = []
		activity.tours.map {|tour| tour_type << tour.tour_type}
		if tour_type.uniq.count < 4
			return 'text-center'
		else
			return ''
		end
	end
end
