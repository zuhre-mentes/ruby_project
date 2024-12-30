class PositionsController < ApplicationController
  skip_before_action :authenticate_user_or_company!, only: [:index, :show]
  before_action :authenticate_company!, only: [:new, :create, :edit, :update, :destroy, :dashboard]
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  def index
    @positions = Position.all.order(created_at: :desc)

    # Search by position title or company name
    if params[:q].present?
      search_term = "%#{params[:q].downcase}%"
      @positions = @positions.joins(:company)
                           .where('LOWER(positions.title) LIKE ? OR LOWER(companies.name) LIKE ?', 
                                  search_term, search_term)
    end

    # Filter by job type
    if params[:type].present?
      @positions = @positions.where(category: params[:type])
    end
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
      redirect_to @position, notice: 'Job listing was successfully created.'
    else
      render :new
    end
  end

  def edit
    unless @position.company == current_company
      redirect_to positions_path, alert: 'You are not authorized to edit this position.'
    end
  end

  def update
    if @position.company == current_company
      if @position.update(position_params)
        redirect_to @position, notice: 'Job listing was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to positions_path, alert: 'You are not authorized to update this position.'
    end
  end

  def destroy
    if @position.company == current_company
      @position.destroy
      redirect_to positions_url, notice: 'Job listing was successfully deleted.'
    else
      redirect_to positions_path, alert: 'You are not authorized to delete this position.'
    end
  end

  def dashboard
    @total_views = current_company.positions.sum(:views_count)
    @total_applications = current_company.positions.joins(:applications).count
    @positions = current_company.positions
  end

  private

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:title, :description, :category, :application_deadline, :image)
  end
end

