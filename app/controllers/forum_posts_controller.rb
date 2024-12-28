class ForumPostsController < ApplicationController
  def index
    @posts = ForumPost.all.order(created_at: :desc)
  end

  def new
    @forum_post = ForumPost.new
    @forum_post.content = params[:ai_response] if params[:ai_response]
    @forum_post.category = "Soru & Cevap"
  end

  def create
    @forum_post = ForumPost.new(forum_post_params)

    if @forum_post.save
      flash[:success] = "Gönderi başarıyla yayınlandı!"
      redirect_to forum_posts_path
    else
      flash.now[:error] = "Gönderi yayınlanırken bir hata oluştu."
      render :new
    end
  end

  private

  def forum_post_params
    params.require(:forum_post).permit(:title, :content, :author_name, :category)
  end
end
