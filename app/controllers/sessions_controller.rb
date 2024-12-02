class SessionsController < ApplicationController
  def new
    # Giriş formu için boş bir aksiyon
  end

  def create
    # E-posta ile kullanıcıyı bul
    user = User.find_by(email: params[:email])

    # Kullanıcı varsa ve şifre doğruysa oturum aç
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have successfully logged in!"
      redirect_to dashboard_path
    else
      flash[:alert] = "Email or password is incorrect."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil # Kullanıcının oturumunu sonlandır
    flash[:notice] = "Checked out."
    redirect_to root_path
  end
end
