require 'rails_helper'

describe ProjectsController do
  before :each do
    @project=create(:project)
  end
  
  describe 'index' do
    it 'returns projects list for user' do
      get :index
      
      expect(response).to have_http_status(:success)
      expect(assigns(:articles).length).to eq 1
   end
  end
  
  describe 'show' do
    it 'shows single project' do
      get :show, id: @project.id
      
      expect(response).to have_http_status(:success)
      expect(assigns(:project)).not_to eq nil
      expect(assigns(:project).title).to eq @project.title
   end
  end
end 
