class ProjectsController < ApplicationController

  def new
    @project = Project.new({:user_id => @user.id})
    @project_count = Project.count + 1
  end

  def create
    @project = Project.new(project_params)
    @project_count = Project.count

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :user_id, :init_fault)
    end

end
