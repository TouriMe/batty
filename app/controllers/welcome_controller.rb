class WelcomeController < ApplicationController
  def index
    @cities = City.all.map{|c| [c.name, c.to_param]}
    @cities.unshift(['All',''])

    @no_white_background = true
    @no_show_title = true
    @transparent_header = true
    @seotags = Seo.find_by_page('home')
    @activities = Activity.all
    @feature_experiences = Tour.where(feature_tour: 'yes')
    @benefits = Benefit.all

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

end
