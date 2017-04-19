module PurchaseHelper
	def driver_skills(driver)
		communication_html = ""
		experience_html = ""
		history_html = ""
		photography_html = ""
		dslr_html = ""

		if driver.english_communication
			communication_html << content_tag(:i, "", :class => 'fa fa-check-circle-o')
			communication_html <<	content_tag(:span, 'English Communication')
		else
			communication_html << content_tag(:i, "", :class => 'fa fa-times-circle-o')
			communication_html <<	content_tag(:span, 'English Communication')
		end
		
		if driver.driving_experience.to_i > 0
			experience_html << content_tag(:i, "", :class => 'fa fa-check-circle-o')
			experience_html <<	content_tag(:span, 'Years of Driving Experiences')
		else
			experience_html << content_tag(:i, "", :class => 'fa fa-times-circle-o')
			experience_html <<	content_tag(:span, 'Years of Driving Experiences')	
		end
		
		if driver.basic_history
			history_html << content_tag(:i, "", :class => 'fa fa-check-circle-o')
			history_html <<	content_tag(:span, 'Basic History')
		else
			history_html << content_tag(:i, "", :class => 'fa fa-times-circle-o')
			history_html <<	content_tag(:span, 'Basic History')
		end
		
		if driver.smartphone_photography
			photography_html << content_tag(:i, "", :class => 'fa fa-check-circle-o')
			photography_html <<	content_tag(:span, 'Smartphone Photography')
		else
			photography_html << content_tag(:i, "", :class => 'fa fa-times-circle-o')
			photography_html <<	content_tag(:span, 'Smartphone Photography')
		end

		if driver.basic_dslr
			dslr_html << content_tag(:i, "", :class => 'fa fa-check-circle-o')
			dslr_html <<	content_tag(:span, 'Basic DSLR')
		else
			dslr_html << content_tag(:i, "", :class => 'fa fa-times-circle-o')
			dslr_html <<	content_tag(:span, 'Basic DSLR')
		end

		skills_html = communication_html + "\n" + 
									experience_html + "\n" + 
									history_html + "\n" +
									photography_html + "\n" + 
									dslr_html
		binding.pry
		return skills_html.html_safe
	end
end
