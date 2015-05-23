class Users::InvitationsController < Devise::InvitationsController
   # GET /resource/invitation/new
  def new
    self.resource = resource_class.new
    @project=Project.find(params[:project])
    render :new
  end

  # POST /resource/invitation
  def create
    self.resource = invite_resource
    resource_invited = resource.errors.empty?

    yield resource if block_given?

    if resource_invited
      if is_flashing_format? && self.resource.invitation_sent_at
        set_flash_message :notice, :send_instructions, :email => self.resource.email
      end
      respond_with resource, :location => after_invite_path_for(current_inviter)
      self.resource.member_projects<<Project.find(params[:user][:project_id])
    else
      respond_with_navigational(resource) { render :new }
    end
  end
  
end