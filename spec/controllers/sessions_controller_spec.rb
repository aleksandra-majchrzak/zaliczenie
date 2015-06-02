require 'rails_helper'

describe Users::SessionsController do
  before :each do
    @user=create(:user)
    sign_in @user
  end
  
  describe 'create' do
    before { request.env["devise.mapping"] = Devise.mappings[:user] }
    before { get :create }
      
    it { should redirect_to(root_path) }
    it { should set_flash }
  end
  
  describe 'destroy' do
      
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
      delete :destroy
    end
      
    it { should redirect_to(root_path) }
    it { should_not render_template(partial: 'layouts/my_navbar_elems') }
    it { should set_flash }
  end
end 
