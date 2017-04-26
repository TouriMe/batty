module ReviewsHelper
	def reviewable(normaluser)
		
		normaluser_email = normaluser.email
		tour_purchased_emails_dates = @tour_purchased_records.order("start_date desc").pluck(:email, :start_date)

		tour_purchased_emails_dates.each do |email_date|
			email = email_date[0]
			start_date = email_date[1]
			if start_date.present?
				return true if comeback_from_tour(normaluser_email,email,start_date)
			end
		end
		return false
	end

	def comeback_from_tour(user_email,email,date)
		return true if user_email == email && Date.today > date
	end

end
