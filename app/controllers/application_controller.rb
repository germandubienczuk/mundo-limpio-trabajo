class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	require 'active_resource'
	protect_from_forgery with: :exception

	before_filter :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :admin) }
		devise_parameter_sanitizer.for(:update) { |u| u.permit(:username, :email, :password, :admin) }
		devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
	end


	
   
end
