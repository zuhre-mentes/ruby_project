class UsersController < ApplicationController
  before_action :require_login, only: [ :edit, :update ] # Kullanıcının giriş yaptığını kontrol et

  def new
    @user = User.new
  end
  def profile
    # Bu metodda kullanıcı profili sadece görüntülenir
    @user = current_user
  end
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Kayıt başarılı!"
      redirect_to login_path
    else
      flash[:alert] = "Kayıt başarısız. Lütfen bilgileri kontrol edin."
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = "Bilgileriniz güncellendi!"
      redirect_to dashboard_path
    else
      flash[:alert] = "Bilgiler güncellenemedi. Lütfen tekrar deneyin."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end
end
