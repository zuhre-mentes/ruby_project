class PositionsController < ApplicationController
  before_action :authenticate_company!, except: [:index, :show]
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  def index
    @positions = Position.all.includes(:company)
    
    if params[:category].present? && params[:category] != "All Job Types"
      @positions = @positions.where(category: params[:category])
    end
    
    if params[:query].present?
      query = "%#{params[:query]}%"
      @positions = @positions.where("title ILIKE ? OR description ILIKE ? OR companies.name ILIKE ?", query, query, query)
                           .joins(:company)
    end
  end

  def show
    @position.increment!(:views_count) unless company_signed_in?
  end

  def new
    @position = current_company.positions.build
  end

  def edit
  end

  def create
    @position = current_company.positions.build(position_params)

    if @position.save
      # Send email to all users
      User.all.each do |user|
        PositionMailer.new_position_notification(user, @position).deliver_later
      end
      
      redirect_to positions_path, notice: 'İlan başarıyla oluşturuldu.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @position.update(position_params)
      redirect_to @position, notice: 'İlan başarıyla güncellendi.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @position.destroy
    redirect_to positions_url, notice: 'İlan başarıyla silindi.'
  end

  def dashboard
    @active_positions_count = current_company.positions.count
    @total_applications_count = Application.joins(:position).where(positions: { company: current_company }).count
    @total_views_count = current_company.positions.sum(:views_count)
    @recent_applications = Application.joins(:position)
                                   .includes(:user, :resume, position: [:company])
                                   .where(positions: { company: current_company })
                                   .order(created_at: :desc)
                                   .limit(10)
  end

  private

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:title, :description, :category, :location, :application_deadline)
  end
end

