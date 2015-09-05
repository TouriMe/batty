class WelcomeController < ApplicationController
  def index
    @cities = City.all.map{|c| [c.name, c.to_param]}
    @cities.unshift(['All',''])
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
