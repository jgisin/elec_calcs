class PanelsController < ApplicationController
  respond_to :js
  before_action :get_project
  before_action :index_project

def index
	@panels = @project.panels.sorted
  @panels.each do |panel|
    panel.save
  end
end

def show
end

def new
    @panel = Panel.new({:project_id => @project.id})
    @panel_count = Panel.count + 1
    @panel_names = Panel.where(:project_id => @project.id).pluck(:panel_name)
    @panel_names.insert(0, "Transformer")
end

def create
	@panels = Panel.where(:project_id => @project.id)
    @panel = Panel.new(panel_params)
    @panel.save
    @panel_count = Panel.count
end
	
def fault
  @panels = Panel.where(:project_id => @project.id)
end

def voltdrop
  @panels = Panel.where(:project_id => @project.id)
end

  def edit
  	@panel = Panel.find(params[:id])
  	@panel_names = Panel.where(:project_id => @panel.project_id).pluck(:panel_name)
    @panel_names.insert(0, "Transformer")
    #For Position in Form
    @panel_count = Panel.count
  end

  def update
    @panels = Panel.where(:project_id => @project.id)
  	@panel = Panel.find(params[:id])
    @panel.update(panel_params)
  end

  def delete
  end
  # DELETE /panels/1
  # DELETE /panels/1.json
  def destroy
    @panel = Panel.find(params[:id])
    Panel.where(:fed_from => @panel.panel_name).destroy(Panel.where(:fed_from => @panel.panel_name).pluck(:id))
    flash[:notice] = "Panel '#{@panel.panel_name}' has been destroyed successfully"
    if @panel.destroy
    respond_to do |format|
      format.html { redirect_to '/dashboard/index', status: 303 }
      format.json { head :no_content }
    end
  end
  end

    def panel_params
      params.require(:panel).permit(:conn_ampacity, :temp, :wire_length, :init_fault, :runs, :voltage, :c_value, :panel_name,
        :f_value, :m_value, :final_value, :project_id, :position, :wire_type, :conduit_type, :run_type,
        :wire_size, :fed_from)
    end
end
