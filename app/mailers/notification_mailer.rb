class NotificationMailer < ApplicationMailer
  default from: ENV['GMAIL_USERNAME']

  def new_position_notification(user, position)
    @user = user
    @position = position
    @company = position.company
    
    mail(
      to: @user.email,
      subject: "Yeni İş İlanı: #{@position.title} - #{@company.name}"
    ) do |format|
      format.html
    end
  end
end 