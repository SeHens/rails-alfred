# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :home_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def home_controller?
    self.class == HomeController
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || startups_path
  end

  def after_sign_out_path_for(resource_or_scope)
    startups_path # Redirect to a specific startup path after signing out
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
