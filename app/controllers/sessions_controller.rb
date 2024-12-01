class SessionsController < ApplicationController
  def new
    # Giriş formu için boş bir aksiyon
  end

  def create
    # E-posta ile kullanıcıyı bul
    user = User.find_by(email: params[:email])

    # Kullanıcı varsa ve şifre doğruysa oturum aç
    if user && user.password == params[:password]
      session[:user_id] = user.id
      flash[:notice] = "Başarıyla giriş yaptınız!"
      redirect_to dashboard_path
    else
      flash[:alert] = "E-posta veya şifre hatalı."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil # Kullanıcının oturumunu sonlandır
    flash[:notice] = "Çıkış yapıldı."
    redirect_to root_path
  end
end