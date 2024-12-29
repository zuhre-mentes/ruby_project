class VerificationsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def new
    @verification = Verification.new
    @badges = Badge.all
  end

  def create
    @verification = Verification.new(verification_params)
    @verification.user_id = current_user.id

    unless @verification.badge_id.present? && Badge.exists?(@verification.badge_id)
      return render json: { error: "Lütfen geçerli bir rozet seçin" }, status: :unprocessable_entity
    end

    if params[:verification][:files].blank?
      return render json: { error: "Lütfen en az bir dosya seçin" }, status: :unprocessable_entity
    end

    if params[:verification][:files].length > 3
      return render json: { error: "En fazla 3 dosya yükleyebilirsiniz" }, status: :unprocessable_entity
    end

    if @verification.save
      # Mail gönderimi
      VerificationMailer.verification_submitted(@verification).deliver_later

      render json: { success: "Dosyalar başarıyla yüklendi. Size email ile bilgilendirme yapılacaktır." }, status: :ok
    else
      error_message = @verification.errors.full_messages.join(", ")
      render json: { error: "Dosya yüklenirken bir hata oluştu: #{error_message}" }, status: :unprocessable_entity
    end
  end

  private

  def verification_params
    params.require(:verification).permit(:badge_id, files: [])
  end
end
