require 'rails_helper'

describe ProjectsController do
  before :each do
    @user=create(:owner)
    sign_in @user
    @project = @user.owned_projects.first
  end
  
  describe 'index' do
    it 'returns projects list for user' do
      get :index
      
      expect(response).to have_http_status(:success)
      expect(assigns(:projects).length).to eq 1
   end
  end
  
  describe 'show' do
    it 'shows single project' do
      get :show, id: @project.id
      
      expect(response).to have_http_status(:success)
      expect(assigns(:project)).not_to eq nil
      expect(assigns(:project).name).to eq @project.name
   end
  end
end 
