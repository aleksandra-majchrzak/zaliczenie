require 'rails_helper'

describe TicketsController do
  before :each do
    @user=create(:owner)
    sign_in @user
    @project = @user.owned_projects.first
    @ticket = @project.tickets.first
  end
  
  describe 'index' do
    it 'returns tickets list for project' do
      get :index, project_id: @project.id
      
      expect(response).to have_http_status(:success)
      expect(assigns(:tickets).length).to eq 1
   end
  end
  
  describe 'show' do
    it 'shows single ticket' do
      get :show, project_id: @project.id, id: @ticket.id
      
      expect(response).to have_http_status(:success)
      expect(assigns(:ticket)).not_to eq nil
      expect(assigns(:ticket).name).to eq @ticket.name
   end
  end
end 
