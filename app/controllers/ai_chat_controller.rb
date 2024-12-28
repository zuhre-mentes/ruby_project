class AiChatController < ApplicationController
  before_action :authenticate_user!
  before_action :set_badge
  
  def show
    # Mesaj geçmişini göster
    @messages = current_user.messages.order(created_at: :asc)
  end

  def create
    @message = current_user.messages.build(content: params[:message])
    
    if @message.save
      # Burada gerçek AI yanıtı entegre edilebilir
      @message.update(response: "Bu bir test yanıtıdır.")
      render json: { message: @message.response }
    else
      render json: { error: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to badges_path, alert: 'Rozet bulunamadı.'
  end
end 