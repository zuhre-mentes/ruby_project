class HomeController < ApplicationController
  def index
    Rails.logger.debug "***** home#index action is being called *****"

    @posts = Post.all 
    @post = Post.new  
  end
end
