class CompaniesController < ApplicationController
  before_action :authenticate_company!, only: [:edit, :update, :remove_logo]
  before_action :set_company, only: [:edit, :update, :remove_logo]

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to edit_company_path(@company), notice: 'Şirket bilgileri başarıyla güncellendi.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def remove_logo
    @company.logo.purge
    redirect_to edit_company_path(@company), notice: 'Logo başarıyla kaldırıldı.'
  end

  private

  def set_company
    @company = current_company
  end

  def company_params
    params.require(:company).permit(:name, :email, :description, :website, :logo)
  end
end
