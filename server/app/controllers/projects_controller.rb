class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    pp = permitted_params
    asoc_p = association_attr pp
    @project = Project.new(name: pp[:name],
                           long_desc: pp[:long_desc],
                           short_desc: pp[:short_desc],
                           year: pp[:year],
                           function_id: pp[:function_id],
                           status_id: pp[:status_id],
                           project_architect_associations_attributes: asoc_p
                          )

    #architect_ids.map { |id| @project.architects << Architect.find(id) }

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

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permitted_params
      base = params.require(:project).permit(
          :name,
          :long_desc,
          :short_desc,
          :year,
          :function_id,
          :status_id,
          :architect_ids => []
      )
      logger.debug base
      return base
    end
    def association_attr pp
      arch_ids = pp[:architect_ids].select {
        |id| !id.blank?
      }
      logger.debug arch_ids
      ret = arch_ids.map { |id| { architect_id: id } }
      logger.debug ret
      return ret
    end
      
end
