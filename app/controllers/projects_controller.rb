class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  autocomplete :user, :email, :full => true
  
  def index
    @owned_projects=current_user.owned_projects
    @member_projects=current_user.member_projects
    @project_index=true
  end
  
  def new
    @project=current_user.owned_projects.build()
    @to_edit=false
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
    @to_edit=false
  end
  
  def destroy
    @project=Project.find(params[:id])
    @project.destroy
    
    redirect_to projects_path
  end
  
  def edit
    @project=Project.find(params[:id])
    @to_edit=true
  end
  
  def update
    @project = Project.find(params[:id])
    
    unless params[:new_member] == nil
      new_user=User.where(:email => project_params[:member_field]) 
      
      if new_user.first ==nil
        flash.now[:error] = "Selected uses is not in database. If you want, invite them!"
        render 'show'
      else
      
        unless @project.members.where(:id => new_user.first.id).empty?
          flash.now[:error] = "This user has been already added to project."
          render 'show'
        else
          @project.members << new_user
          redirect_to @project
        end
      end
    else
      if @project.update(project_params)
        redirect_to @project
      else
        render 'edit'
      end
    end
  end
  
  private
  def project_params
    params.require(:project).permit(:name, :description, :member_field, :member_ids => [])
  end
  
end
