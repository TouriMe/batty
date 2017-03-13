class WelcomeController < ApplicationController
  def index
    redirect_to maintenance_path if ENV['MAINTENANCE_MODE'] == 'true'
    @cities = City.all.map{|c| [c.name, c.to_param]}
    @cities.unshift(['All',''])
  
    @no_white_background = true
    @no_show_title = true
    @transparent_header = true
    @seotags = Seo.find_by_page('home')
  
  end

  def terms

  end

  def faq

  end

  def feedback

  end

  def privacy

  end

  def about

  end

  def maintenance
    render(:layout => "layouts/maintenance")
  end
end
