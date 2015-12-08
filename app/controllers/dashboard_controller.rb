class DashboardController < ApplicationController
	def index
		@projects = Project.where(:user_id => session[:user_id])
	end

end
