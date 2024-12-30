class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_position

  def new
    @application = Application.new
    @resumes = current_user.resumes
  end

  def create
    @application = current_user.applications.build(application_params)
    @application.position = @position

    if @application.save
      redirect_to position_path(@position), notice: 'Application was successfully submitted.'
    else
      @resumes = current_user.resumes
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_position
    @position = Position.find(params[:position_id])
  end

  def application_params
    params.require(:application).permit(:resume_id)
  end
end
  