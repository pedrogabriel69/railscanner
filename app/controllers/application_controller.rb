class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def after_sign_in_path_for(current_user)
    current_user.admin? ? admin_admin_index_path : root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :surname)
    devise_parameter_sanitizer.for(:account_update).push(:name, :surname)
  end
end
