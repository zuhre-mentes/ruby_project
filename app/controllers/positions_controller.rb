class PositionsController < ApplicationController
  before_action :authenticate_company!, only: [:new, :create, :edit, :update, :destroy, :dashboard]
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  def index
    @positions = Position.all.order(created_at: :desc)
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
      redirect_to @position, notice: 'İlan başarıyla oluşturuldu.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @position.update(position_params)
      redirect_to @position, notice: 'İlan başarıyla güncellendi.'
    else
      render :edit
    end
  end

  def destroy
    @position.destroy
    redirect_to positions_url, notice: 'İlan başarıyla silindi.'
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

