require 'rails_helper'

feature 'log in' do
  before :each do
    @password='vvvvvvvv'
    @new_user=User.create!(:email => 'v@v.v', :password => @password)
    @other_user=User.create(:email => 'user2@example.com', :password => 'abcdefg2')
  end
  
  describe 'log in with success', type: :feature do
    it 'user logs in succesfully' do
      visit(new_user_session_path)
      within ('#new_user') do
        fill_in 'Email', :with => @new_user[:email]
        fill_in 'Password', :with => @password  #cause it gets encrypted in devise
      end
      click_button 'Create User'
      expect(page).to have_content 'Signed in successfully.'
    end
  end
  
  describe 'log in with failure', type: :feature do    
    it 'user logs in unsuccesfully' do
      visit(new_user_session_path)
      within ('#new_user') do
        fill_in 'Email', :with => @new_user[:email]
        fill_in 'Password', :with => @other_user[:password]
      end
      click_button 'Create User'
      expect(page).to have_content "Invalid email or password."
    end
    
  end
end 
