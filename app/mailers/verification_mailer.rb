class VerificationMailer < ApplicationMailer
  def verification_submitted(verification)
    @verification = verification
    @user = verification.user
    @badge = verification.badge

    mail(
      to: @user.email,
      subject: "Rozet Doğrulama Başvurunuz Alındı"
    )
  end
end 