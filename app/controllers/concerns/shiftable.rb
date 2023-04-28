module Shiftable
  extend ActiveSupport::Concern

  def set_year_and_month
    @year = params[:year].to_i.zero? ? this_year : params[:year].to_i
    @month = params[:month].to_i.zero? ? this_month : params[:month].to_i
    @day = params[:day].to_i.zero? ? Time.zone.today.day : params[:day].to_i
  end

  def set_date
    @date = Date.new(@year, @month, @day)
  end

  def set_shifts
    @shifts = current_user.shifts.where(date: @date.all_month).to_a
    @shifts_with_dates = @date.all_month.index_with { |date| @shifts.detect { |s| s.date == date } }
  end
end
