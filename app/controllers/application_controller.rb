# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional fields in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    alfred_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    alfred_root_path
  end
end
