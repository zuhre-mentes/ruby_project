class HomeController < ApplicationController
  def index
    Rails.logger.debug "***** home#index action is being called *****"

    @posts = Post.all # Tüm içerikleri yükle
    @post = Post.new  # Yeni post için form
  end
end
