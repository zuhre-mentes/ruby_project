class PositionsController < ApplicationController
  before_action :authenticate_company!, except: [:index, :show]
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  def index
    @positions = Position.all.includes(:company)
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
      redirect_to @position, notice: 'Position was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @position.update(position_params)
      redirect_to @position, notice: 'Position was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @position.destroy
    redirect_to positions_url, notice: 'Position was successfully deleted.'
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
    params.require(:position).permit(:title, :description, :requirements, :location, :position_type, :application_deadline)
  end
end

