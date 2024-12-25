class PostsController < ApplicationController
  before_action :require_login, only: [:create, :destroy] # Kullanıcının giriş yaptığından emin olun

  def create
    @post = current_user.posts.new(post_params) # Post'u oturum açmış kullanıcıya bağla

    if @post.save
      flash[:notice] = "Post successfully created!"
      redirect_to dashboard_path
    else
      flash[:alert] = "Failed to create post."
      redirect_to dashboard_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    
    # Sadece postu paylaşan kullanıcı silebilir
    if @post.user == current_user
      @post.destroy
      flash[:notice] = "Post successfully deleted."
    else
      flash[:alert] = "You are not authorized to delete this post."
    end
    redirect_to dashboard_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :is_event, :date)
  end
end
