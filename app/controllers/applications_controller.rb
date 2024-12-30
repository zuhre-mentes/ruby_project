class ApplicationsController < ApplicationController
    before_action :set_position, only: [:new, :create]
  
    # Başvuru formu için sayfa
    def new
      @application = Application.new
    end
  
    # Başvuruyu kaydetme işlemi
    def create
      @application = @position.applications.build(application_params)
  
      if @application.save
        redirect_to position_path(@position), notice: 'Başvurunuz başarıyla gönderildi.'
      else
        render :new
      end
    end
  
    private
  
    # Pozisyonu bulma
    def set_position
      @position = Position.find(params[:position_id])
    end
  
    # Başvuru parametrelerini alıyoruz
    def application_params
      params.require(:application).permit(:resume, :cover_letter)
    end
  end
  