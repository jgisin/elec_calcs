class PanelsController < ApplicationController
  before_action :get_project
  before_action :index_project
  respond_to :html, :js

def index
	@panels = @project.panels
end

def new
    @panel = Panel.new({:project_id => @project.id})
    @panel_count = Panel.count + 1
    @panel_names = Panel.where(:project_id => @project.id).pluck(:panel_name)
    @panel_names.insert(0, "Transformer")
end

def create
    @panel = Panel.new(panel_params)
    @panel.save
    @panel_count = Panel.count
end
	
def results
  respond_to do |format|
    format.html { render partial: 'results' }
  end
end




    def panel_params
      params.require(:panel).permit(:wire_length, :init_fault, :runs, :voltage, :c_value, :panel_name,
        :f_value, :m_value, :final_value, :project_id, :position, :wire_type, :conduit_type, :run_type,
        :wire_size, :fed_from)
    end
end
