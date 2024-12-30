class ResumesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  def index
    @resumes = Resume.all.includes(:user).with_attached_pdf_file
  end

  def show
  end

  def new
    @resume = Resume.new
  end

  def edit
  end

  def create
    @resume = current_user.resumes.build(resume_params)
    
    if @resume.save
      redirect_to resumes_path, notice: 'CV successfully uploaded.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @resume.update(resume_params)
      redirect_to resumes_path, notice: 'CV successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resume.destroy
    redirect_to resumes_path, notice: 'CV successfully deleted.'
  end

  private

  def set_resume
    @resume = Resume.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:title, :description, :pdf_file)
  end
end
