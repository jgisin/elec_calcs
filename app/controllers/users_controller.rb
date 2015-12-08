class UsersController < ApplicationController

  respond_to :html

  def index	
  end

  def login 
  end

  def logout
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to(action: 'index')  
  end


  def edit
    @user = User.find(session[:user_id])  
  end

  def update
    @user = User.find(session[:user_id])
    @user.update(user_params)
  end


  def new
  	@user = User.new
  end

  def create
	  @user = User.new(user_params)
	 if  @user.save!
	 	session[:user_id] = @user.id
	 	session[:user_name] = @user.user_name
	 	redirect_to(:controller => 'dashboard', :action => 'index')
	 else
	 	render 'form'
	 end
  end

  def attempt_login
  	if params[:user_name].present? && params[:password].present?
  		found_user = User.where(:user_name => params[:user_name]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end
  	if authorized_user
      session[:user_id] = authorized_user.id
      session[:user_name] = authorized_user.user_name
  		redirect_to(:controller => 'dashboard', :action => 'index', :user_id => authorized_user.id)
  	else
  		flash[:notice] = "Invalid username/password combination."
  		redirect_to(:action => 'index')
  	end
  end

  

	def user_params
      params.require(:user).permit(:user_name, :password, :first_name, :last_name, :email)
   	end

end
