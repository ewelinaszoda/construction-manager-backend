class ProjectsController < ApplicationController

  def index
    projects = Project.all
    render json: { projects: projects } 
  end

  def show
    project = Project.find_by(params[:id])
    render json: { projects: project }
  end

  def create
    project = Project.create(project_params)
  end

  private

  def project_params
      params.require(:project).permit(
        :name, 
        :address,
        :image, 
        :description, 
        :client,
        :project_manager,
        :site_manager,
        :quantity_surveyor,
        :start_date,
        :end_date,
        :user_id,
      )
  end

end
