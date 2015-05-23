class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  autocomplete :user, :email, :full => true
  
  def index
    @owned_projects=current_user.owned_projects
    @member_projects=current_user.member_projects
  end
  
  def new
    @project=current_user.owned_projects.build()
  end
  
  def create
    @project = current_user.owned_projects.build(project_params)
 
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end
  
  def show
    @project=Project.find(params[:id])
  end
  
  def destroy
    @project=Project.find(params[:id])
    @project.destroy
    
    redirect_to projects_path
  end
  
  def edit
    @project=Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
 
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end
  
  private
  def project_params
    params.require(:project).permit(:name, :description, :member_id)
  end
  
end
