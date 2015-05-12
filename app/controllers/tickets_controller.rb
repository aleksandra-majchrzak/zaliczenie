class TicketsController < ApplicationController
  def index
      @project= Project.find(params[:project_id])
      @ticket=@project.tickets.all
  end
  
  def new
    @project=Project.find(params[:project_id])
    @ticket=@project.tickets
  end
  
  def create
    @project= Project.find(params[:project_id])
    @ticket = @project.tickets.new(ticket_params)
 
    if @ticket.save
      redirect_to @ticket
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
    @ticket=Ticket.find(params[:id])
  end
  
  def update
    @ticket = Ticket.find(params[:id])
 
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render 'edit'
    end
  end
  
  private
  def ticket_params
    params.require(:ticket).permit(:name, :description, :priority, :difficulty, :status)
  end
end
