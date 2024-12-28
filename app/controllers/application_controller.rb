class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  allow_browser versions: :modern

  
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  
  def logged_in?
    !!current_user
  end

  
  def require_login
    unless logged_in?
      flash[:alert] = "You need to log in to access this page."
      redirect_to login_path
    end
  end


 #helper_method :current_user - Doğan

 #def current_user @current_user ||= User.find(session[:user_id]) if session[:user_id] end - Doğan 

 #def authenticate_user! redirect_to new_user_session, alert: "You must be logged in to access this page." unless current_user end - Doğan
 
 #before_action :authenticate_user! - Doğan

end
