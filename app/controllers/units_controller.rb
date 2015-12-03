class UnitsController < ApplicationController
  respond_to :js
  before_action :get_project
  before_action :index_project

	def index
		@units = Unit.where(:project_id => @project.id)
	end

	def new
	    @unit= Unit.new({:project_id => @project.id})
	end

	def create
		@units = Unit.where(:project_id => @project.id)
	    @unit = Unit.new(unit_params)
	    @unit.save
	end

  	def edit
  		@unit = Unit.find(params[:id])
  	end

  	def update
	    @units = Unit.where(:project_id => @project.id)
	  	@unit = Unit.find(params[:id])
	    @unit.update(unit_params)
  	end

  	def destroy
  	@unit = Unit.find(params[:id])
    @unit.destroy
	    respond_to do |format|
	      format.html { redirect_to '/dashboard/index', notice: "Unit: #{@unit.unit_name} was successfully destroyed" }
	      format.json { head :no_content }
	    end
  	end

  	def load
	  	@units = Unit.where(:project_id => @project.id)
  	end

  	def hvac
		@unit = Unit.find(params[:id])
  	end

  	def appliance
	  	@unit = Unit.find(params[:id])
  	end

  	def appupdate
	  	@unit = Unit.find(params[:id])
	  	@unit.update(unit_params)
  	end

  	def show
	  	@unit = Unit.find(params[:id])
  	end

	def unit_params
      params.require(:unit).permit(:unit_name, :unit_meter, :bedrooms, :sqr_ftg, :washer, :microwave,
      	:dishwasher, :disposal, :dryer, :voltage, :heating, :cooling, :other_load, :project_id)
   	end
end
