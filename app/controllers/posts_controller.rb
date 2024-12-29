class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = @post.is_event ? "Event successfully created!" : "Post successfully created!"
    else
      flash[:alert] = @post.is_event ? "Failed to create event." : "Failed to create post."
    end

    redirect_to dashboard_path
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.user == current_user
      @post.destroy
      flash[:notice] = @post.is_event ? "Event successfully deleted." : "Post successfully deleted."
    else
      flash[:alert] = "You are not authorized to delete this #{@post.is_event ? 'event' : 'post'}."
    end

    redirect_to dashboard_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :is_event, :date)
  end

  def index
    @posts = Post.all.order(created_at: :desc) # Tüm gönderileri sırala
  end
  
end