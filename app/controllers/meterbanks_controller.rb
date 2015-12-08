class MeterbanksController < ApplicationController
  respond_to :js
  before_action :get_project
  before_action :index_project

  	def index
  		@meterbanks = Meterbank.where(:project_id => @project.id)	
  	end

  	def new
  		@meterbank = Meterbank.new(:project_id => @project.id)
  		@largest_unit = Unit.where(:project_id => @project.id).map {|unit| unit.unit_name}
  	end

  	def create
  		@meterbanks = Meterbank.where(:project_id => @project.id)
	    @meterbank = Meterbank.new(meterbank_params)
	    @meterbank.save
  	end

  	def edit
  		@meterbank = Meterbank.find(params[:id])
  		@largest_unit = Unit.where(:project_id => @meterbank.project_id).map {|unit| unit.unit_name}
  	end

  	def update
  		@meterbanks = Meterbank.where(:project_id => @project.id)
  		@meterbank = Meterbank.find(params[:id])
	    @meterbank.update(meterbank_params)
  	end

  	def delete
  	end

  	def destroy
  		@meterbank = Meterbank.find(params[:id])
    	@meterbank.destroy
	    respond_to do |format|
	      format.html { redirect_to '/dashboard/index', notice: "Meterbank: #{@meterbank.bus_name} was successfully destroyed" }
	      format.json { head :no_content }
	    end
  	end

  	def load
  		@meterbanks = Meterbank.where(:project_id => @project.id)
  	end

  	def meterbank_params
      params.require(:meterbank).permit(:bus_name, :unit_count, :largest_unit, :dryer_demand, 
      	:load_demand, :lighting, :appliance, :dryer_total, :hvac_total, :total_load, :project_id)
   	end
	
end
