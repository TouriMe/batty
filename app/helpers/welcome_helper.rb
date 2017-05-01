module WelcomeHelper
	def number_of_reviews(tour)
		tour_reviews = Review.where(review_type: 'tour', name: "#{tour.name}").count
	end
end
