class BadgesController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: :index

  def index
    @badges = Badge.includes(:badge_category).all

    
    if params[:search].present?
      search_term = "%#{params[:search].downcase}%"
      @badges = @badges.where("LOWER(badges.name) LIKE ? OR LOWER(badges.description) LIKE ?", search_term, search_term)
    end

    
    if params[:category].present?
      @badges = @badges.where(badge_categories: { name: params[:category] })
    end

    
    @badges = @badges.distinct
  end

  def show
    @badge = Badge.includes(:badge_category, :skills).find(params[:id])
    authorize @badge
  end

  def approve
    @badge = Badge.find(params[:id])
    authorize @badge

    if @badge.update(status: "approved")
      redirect_to badges_path, notice: "Badge başarıyla onaylandı."
    else
      redirect_to badges_path, alert: "Badge onaylanırken bir hata oluştu."
    end
  end

  def related
    @badge = Badge.find(params[:id])

    if params[:count]
        total_count = Badge.where.not(id: @badge.id).count
        return render json: { total_count: total_count }
    end

    page = params[:page].to_i
    per_page = 3

    related_badges = Badge.where.not(id: @badge.id)
                         .offset(page * per_page)
                         .limit(per_page)

    render json: {
        badges: related_badges.map { |b| {
            id: b.id,
            name: b.name,
            description: b.description,
            icon_url: nil
        }}
    }
  end
end
