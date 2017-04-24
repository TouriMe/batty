module ToursHelper
	def latlng?(latlng)
		latlng.present? ? latlng : "13.3671,103.8448"
	end
end
