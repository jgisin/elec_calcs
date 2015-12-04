class MeterbanksController < ApplicationController
  respond_to :js
  before_action :get_project
  before_action :index_project
	
end
