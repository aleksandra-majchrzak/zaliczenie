class Users::SessionsController < Devise::SessionsController
 before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
     super
     new_assignments=current_user.assignments.where('created_at > :last_signed_in', :last_signed_in => current_user.last_sign_in_at)
     if !new_assignments.empty?
       new_tickets=""
       new_assignments.each{|a| new_tickets<<a.ticket.name<<", "}
       new_tickets.chop!.chop!
       gflash :now, :notice => "You have got new tickets: #{new_tickets}. Check them in 'My Tickets' section."
     end
   end

  # DELETE /resource/sign_out
   def destroy
     super
   end

  # protected

  # You can put the params you want to permit in the empty array.
   def configure_sign_in_params
     devise_parameter_sanitizer.for(:sign_in) << :attribute
   end
end
