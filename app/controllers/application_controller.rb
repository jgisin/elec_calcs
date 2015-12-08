class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def get_project
    if params[:project_id]
        @project = Project.find(params[:project_id])
    end
end

def index_project
	@projects = Project.where(:user_id => session[:user_id])
end

private 
	def confirm_logged_in
		unless session[:user_id]
		  flash[:notice] = "Please log in."
		  redirect_to(:controller => 'users', :action => 'index')
		  return false
		else
		  return true
		end
	end





end
