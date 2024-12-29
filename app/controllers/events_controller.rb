class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy, :join]

  def index
    @events = Post.where(is_event: true).order(date: :asc) # Sadece etkinlikleri listele
    @event = Post.new # Form için boş bir event nesnesi
  end

  def create
    @event = current_user.posts.new(post_params.merge(is_event: true)) # Etkinlik olarak işaretle

    if @event.save
      flash[:notice] = "Etkinlik başarıyla oluşturuldu!"
    else
      flash[:alert] = "Etkinlik oluşturulamadı!"
    end

    redirect_to events_path
  end

  def destroy
    @event = Post.find(params[:id])

    if @event.user == current_user
      @event.destroy
      flash[:notice] = "Etkinlik başarıyla silindi!"
    else
      flash[:alert] = "Bu etkinliği silme yetkiniz yok!"
    end

    redirect_to events_path
  end

  def join
    event = Post.find(params[:id]) # Etkinliği bul
    if current_user.attended_events << event
      redirect_to events_path, notice: "Etkinliğe başarıyla katıldınız!"
    else
      redirect_to events_path, alert: "Etkinliğe katılırken bir sorun oluştu."
    end
  end
  

  private

  def post_params
    params.require(:post).permit(:content, :description, :date)
  end
  
end