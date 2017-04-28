module PurchaseHelper
	def driver_skills(driver)
		communication_html = ""
		experience_html = ""
		history_html = ""
		photography_html = ""
		dslr_html = ""

		if driver.english_communication
			communication_html << content_tag(:p) do
				concat content_tag(:i, "", :class => 'fa fa-check-circle-o check')
				concat content_tag(:span, ' English Communication')
			end
		else
			communication_html << content_tag(:p) do
				concat content_tag(:i, "", :class => 'fa fa-times-circle-o uncheck')
				concat content_tag(:span, ' English Communication')
			end
		end
		
		if driver.driving_experience.to_i > 0
			experience_html << content_tag(:p) do
				concat content_tag(:i, "", :class => 'fa fa-check-circle-o check')
				concat content_tag(:span, ' Years of Driving Experiences')	
			end
		else
			experience_html << content_tag(:p) do
				concat content_tag(:i, "", :class => 'fa fa-times-circle-o uncheck')
				concat content_tag(:span, ' Years of Driving Experiences')	
			end
		end
		
		if driver.basic_history
			history_html << content_tag(:p) do
				concat content_tag(:i, "", :class => 'fa fa-check-circle-o check')
				concat content_tag(:span, ' Basic History')
			end
		else
			history_html << content_tag(:p) do
				concat content_tag(:i, "", :class => 'fa fa-times-circle-o uncheck')
				concat content_tag(:span, ' Basic History')
			end
		end
		
		if driver.smartphone_photography
			photography_html << content_tag(:p) do
				concat content_tag(:i, "", :class => 'fa fa-check-circle-o check')
				concat content_tag(:span, ' Smartphone Photography')
			end
		else
			photography_html << content_tag(:p) do
				concat content_tag(:i, "", :class => 'fa fa-times-circle-o uncheck')
				concat content_tag(:span, ' Smartphone Photography')
			end
		end

		if driver.basic_dslr
			dslr_html << content_tag(:p) do
				concat content_tag(:i, "", :class => 'fa fa-check-circle-o check')
				concat content_tag(:span, ' Basic DSLR')
			end
		else
			dslr_html << content_tag(:p) do
				concat content_tag(:i, "", :class => 'fa fa-times-circle-o uncheck')
				concat content_tag(:span, ' Basic DSLR')
			end
		end

		skills_html = communication_html + experience_html + history_html + photography_html + dslr_html
		return skills_html.html_safe
	end
end
