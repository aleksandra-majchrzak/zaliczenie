require 'rails_helper'

feature 'add project' do
  before :each do
    @user=User.create(:email => 'user@example.com', :password => 'abcdefg')
    login_as(@user, :scope => :user)
    @new_project={:name =>'project1', :description => 'desc1'}
  end
  
  describe 'adding new project with success', type: :feature do
    before do
        login_as(@user, :scope => :user)
    end   
    it 'user adds new project succesfully' do      
      visit(new_project_path)
      within ('#new_project') do
        fill_in 'project_name', :with => @new_project[:name]
        fill_in 'project_description', :with => @new_project[:description]
      end
      click_button 'Create Project'
      expect(page).to have_content @new_project[:name]
      expect(page).to have_content 'Members'
    end
  end
  
  describe 'adding new project with failure', type: :feature do 
    before do
        login_as(@user, :scope => :user)
    end
    it 'user adds new project unsuccesfully' do      
      visit(new_project_path)
      within ('#new_project') do
        fill_in 'project_description', :with => @new_project[:description]
      end
      click_button 'Create Project'
      expect(page).to have_content "can't be blank"
    end
    
  end
end 
