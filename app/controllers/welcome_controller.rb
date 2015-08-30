class WelcomeController < ApplicationController
  def index
    @cities = City.all.map{|c| [c.name, c.to_param]}
    @cities.unshift(['All',''])
  end
end
