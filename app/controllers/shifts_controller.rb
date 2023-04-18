class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_year_and_month

  def show
    @shift = current_user.shifts
  end

  private

    def set_year_and_month
      @year = params[:year].to_i.zero? ? this_year : params[:year].to_i
      @month = params[:month].to_i.zero? ? this_month : params[:month].to_i
    end
end
