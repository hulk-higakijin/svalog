class CompaniesController < ApplicationController
  def show; end

  def new; end

  def edit; end

  private

    def set_company
      @company = Company.find(params[:id])
    end
end
