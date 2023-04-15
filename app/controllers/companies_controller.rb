class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit]

  def show; end

  def new
    @company = Company.new
  end

  def edit; end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :address)
    end

    def set_company
      @company = Company.find(params[:id])
    end
end
