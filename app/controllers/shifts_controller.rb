class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_year_and_month

  def show
    @shift = current_user.shifts
  end

  private

    def set_year_and_month
      @year = params[:year].to_i || this_year
      @month = params[:month].to_i || this_month
    end
end
