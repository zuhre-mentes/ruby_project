class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user_or_company!
  before_action :configure_permitted_parameters, if: :devise_controller?
  allow_browser versions: :modern

  protected

  def authenticate_user_or_company!
    if devise_controller? && (resource_name == :company || params[:controller] == 'companies/sessions')
      return true
    end
    
    unless current_user || current_company
      authenticate_user!
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Company)
      dashboard_positions_path
    else
      dashboard_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :company
      new_company_session_path
    else
      new_user_session_path
    end
  end
end
