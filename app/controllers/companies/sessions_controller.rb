class Companies::SessionsController < Devise::SessionsController
  layout false
  skip_before_action :authenticate_user_or_company!, only: [:new, :create]
  
  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end

  protected

  def after_sign_in_path_for(resource)
    dashboard_positions_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_company_session_path
  end
end 