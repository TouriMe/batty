class ApiController < ApplicationController
  before_filter { response.headers["Access-Control-Allow-Origin"] = "*" }
end
