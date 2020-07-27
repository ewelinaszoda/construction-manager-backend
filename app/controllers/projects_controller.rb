class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    render json: @projects, each_serializer: ProjectSerializer
  end


  def show
    @project = Project.find_by(project_params[:id])
    render json: @project
  end

  def create
    @project = Project.create(
    user_id: logged_in_user.id, 
    name: params[:name],
    address: params[:address],
    image: params[:image], 
    description: params[:description], 
    client: params[:client],
    project_manager: params[:project_manager],
    site_manager: params[:site_manager],
    quantity_surveyor: params[:quantity_surveyor],
    start_date: params[:start_date],
    end_date: params[:end_date])
    if @project.valid?
      render json: { project: ProjectSerializer.new(@project) }
    else
      render json: { error: @project.errors.full_messages }
    end
  end

  def delete 
    project = logged_in_user
    project.destroy

    render json: project
  end 

  def my_projects
    projects = logged_in_user.projects
    render json: projects
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
      )
  end

end
