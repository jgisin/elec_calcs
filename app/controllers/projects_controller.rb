class ProjectsController < ApplicationController
  before_action :set_project, only: [:details, :show, :edit, :update, :destroy]
  respond_to :js


  def new
    #Instantiate project for form
    @project = Project.new

    #For Position in Form
    @project_count = Project.count + 1
  end

  def edit
    #For Position in Form
    @project_count = Project.count
  end

  def create
    #Param for Dashboard/Index
  	@projects = Project.all

    #Param for Position in Form
    @project_count = Project.count

    #Create and Save Project
    @project = Project.new(project_params)
    @project.save


  end

  def details
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to '/dashboard/index', notice: "Project: #{@project.name} was successfully destroyed" }
      format.json { head :no_content }
    end
  end

  def update
    #Param for Dashboard/Index
    @projects = Project.all

    @project.update(project_params)
 
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :user_id, :init_fault, :position)
    end

end
