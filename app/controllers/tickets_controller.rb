class TicketsController < ApplicationController
  before_filter :authenticate_user!, except:[:index, :show]
  load_and_authorize_resource
  
  def index
      @project= Project.find(params[:project_id])
      @tickets=@project.tickets.all
  end
  
  def new
    @project=Project.find(params[:project_id])
    @ticket=@project.tickets.build
    @status_ar={'active'=> :active, 'closed'=> :closed, 'cancelled'=> :cancelled}
  end
  
  def create
    @project= Project.find(params[:project_id])
    @ticket = @project.tickets.build(ticket_params)
    @status_ar={'active'=> :active, 'closed'=> :closed, 'cancelled'=> :cancelled}
 
    if @ticket.save
      redirect_to project_ticket_path(@project, @ticket)
    else
      render 'new'
    end
  end
  
  def show
    @project= Project.find(params[:project_id])
    @ticket=@project.tickets.find(params[:id])
  end
  
  def destroy
    @project= Project.find(params[:project_id])
    @ticket=@project.tickets.find(params[:id])
    @ticket.destroy
    
    redirect_to project_tickets_path
  end
  
  def edit
    @project= Project.find(params[:project_id])
    @ticket=@project.tickets.find(params[:id])
    @status_ar={'active'=> :active, 'closed'=> :closed, 'cancelled'=> :cancelled}
  end
  
  def update
    @project= Project.find(params[:project_id])
    @ticket=@project.tickets.find(params[:id])
 
    if @ticket.update(ticket_params)
      redirect_to project_ticket_path(@project, @ticket)
    else
      render 'edit'
    end
  end
  
  def list_all
    @projects=current_user.projects.all
    #@projects << curren_user.member_projects.all
  end
  
  private
  def ticket_params
    params.require(:ticket).permit(:name, :description, :priority, :difficulty, :status, :single_attachment,  :inner_attachment_name, :remove_single_attachment)
  end
end
