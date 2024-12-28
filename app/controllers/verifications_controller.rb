class VerificationsController < ApplicationController
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  def new
    @verification = Verification.new
    @badges = Badge.all
  end

  def create
    @verification = Verification.new(verification_params)
    @verification.user_id = current_user.id

    unless @verification.badge_id.present? && Badge.exists?(@verification.badge_id)
      flash[:error] = "Lütfen geçerli bir rozet seçin"
      return redirect_to new_verification_path
    end

    if @verification.save
      flash[:success] = "Dosyalar başarıyla yüklendi."
      redirect_to verifications_path
    else
      error_message = @verification.errors.full_messages.join(", ")
      flash[:error] = "Dosya yüklenirken bir hata oluştu: #{error_message}"
      redirect_to new_verification_path
    end
  end

  private

  def verification_params
    params.require(:verification).permit(:badge_id, files: [])
  end
end
