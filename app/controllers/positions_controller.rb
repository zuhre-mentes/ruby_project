class PositionsController < ApplicationController
  before_action :authenticate_company!, only: [:new, :create, :edit, :update, :destroy, :dashboard, :remove_image]
  before_action :set_position, only: [:edit, :update, :destroy, :remove_image]
  layout false, only: [:index, :dashboard]

  def index
    # Base query with company includes
    @positions = Position.includes(:company).order(created_at: :desc)
    
    # Filter by search query if present
    if params[:q].present?
      query = "%#{params[:q].downcase}%"
      @positions = @positions.joins(:company)
                           .where('LOWER(positions.title) LIKE ? OR LOWER(companies.name) LIKE ?', query, query)
    end
    
    # Filter by job type if present
    @positions = @positions.where(category: params[:type]) if params[:type].present?
  end

  def dashboard
    @positions = current_company.positions
    @total_views = @positions.sum(:views_count)
    @total_applications = @positions.joins(:applications).count
  end

  def show
    @position = Position.find(params[:id])
    @position.increment_views unless current_company == @position.company
  end

  def new
    @position = current_company.positions.build
  end

  def create
    @position = current_company.positions.build(position_params)
    if @position.save
      redirect_to positions_path, notice: "Job posting created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @position.update(position_params)
      redirect_to dashboard_positions_path, notice: "Job posting updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @position.destroy
    redirect_to dashboard_positions_path, notice: "Job posting deleted successfully!"
  end

  def remove_image
    @position.image.purge
    redirect_to edit_position_path(@position), notice: "Image removed successfully!"
  end

  private

  def set_position
    @position = current_company.positions.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:title, :description, :category, :application_deadline)
  end
end

