class RegistrationsController < Devise::RegistrationsController
	prepend_before_filter :require_no_authentication, only: [ :none ]
 	prepend_before_filter :authenticate_scope!, only: [:edit, :new, :create]
	def new
		if current_user.admin?
			super
		else
       		redirect_to :root, :notice => 'No puede crear Usuarios si no es administrador'
		end
	end

end