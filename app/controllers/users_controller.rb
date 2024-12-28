class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def new
    @user = User.new
  end

  def profile
    @user = current_user
    @badges = @user.badges
  end

  def create
    @user = User.new(user_create_params)

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

    if @user.update(user_update_params)
      flash[:notice] = "Bilgileriniz güncellendi!"
      redirect_to profile_path
    else
      flash[:alert] = "Bilgiler güncellenemedi. Lütfen tekrar deneyin."
      render :edit
    end
  end

  private

  def user_create_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def user_update_params
    params.require(:user).permit(:personal_information, :about_me, :education, :experience, :skills)
  end
end
