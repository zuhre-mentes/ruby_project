class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  # Geçerli oturumdaki kullanıcı
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Kullanıcının oturum açıp açmadığını kontrol eder
  def logged_in?
    !!current_user
  end

  # Kullanıcı oturum açmadıysa yönlendir
  def require_login
    unless logged_in?
      flash[:alert] = "Bu sayfaya erişmek için giriş yapmanız gerekiyor."
      redirect_to login_path
    end
  end
end