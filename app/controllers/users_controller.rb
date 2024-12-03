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
    @user = User.new(user_create_params)

    if @user.save
      flash[:notice] = "Registration successful!"
      redirect_to login_path
    else
      flash[:alert] = "Registration failed. Please check the information."
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_update_params)
      flash[:notice] = "Your information has been updated!"
      redirect_to profile_path
    else
      flash[:alert] = "Information could not be updated. Please try again."
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

  def set_user
    @user = current_user 
  end

end
