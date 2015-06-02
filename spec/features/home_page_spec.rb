require 'rails_helper'

feature 'home page' do
  describe 'default user visits home page', type: :feature do
    it 'default user sees home page' do
      visit '/'
      
        expect(page). to have_content('JOIN US!')
    end
  end
  
  describe 'logged in user visits home page', type: :feature do  
    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end    
    it 'logged in user sees home page' do
      
      visit '/'
           
      expect(body). to have_content('My projects')
      expect(body). to have_content('New project')
    end
    
  end
end 
