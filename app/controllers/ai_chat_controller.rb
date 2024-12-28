class AiChatController < ApplicationController
  def show
    @badge = Badge.find(params[:id])
    @ai_response = params[:ai_response]
  end

  def chat
    message = params[:message]
    badge = Badge.find(params[:badge_id])

    
    response = generate_ai_response(message, badge)

    
    session[:last_ai_response] = response

    render json: { response: response }
  end

  private

  def generate_ai_response(message, badge)
    
  end
end
