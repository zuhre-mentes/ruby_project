class PositionMailer < ApplicationMailer
  def new_position_notification(user, position)
    @user = user
    @position = position
    @company = position.company
    
    mail(
      to: @user.email,
      subject: "Yeni İş İlanı: #{@position.title} - #{@company.name}"
    )
  end
end 