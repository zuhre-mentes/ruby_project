class Companies::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def remove_logo
    current_company.logo.purge
    redirect_back(fallback_location: edit_company_registration_path, notice: 'Logo başarıyla kaldırıldı.')
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :description, :logo])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description, :logo])
  end

  def after_sign_up_path_for(resource)
    new_company_session_path
  end
end 