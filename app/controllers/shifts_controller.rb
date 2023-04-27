class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_year_and_month
  before_action :set_date
  before_action :set_shifts

  def show; end

  def edit; end

  def update
    shifts = []
    shift_params.each do |id, shift_data|
      date = Date.new(@year, @month, id.to_i)
      start_at = DateTime.new(@year, @month, id.to_i, shift_data[:start_at]['(4i)'].to_i, shift_data[:start_at]['(5i)'].to_i)
      finish_at = DateTime.new(@year, @month, id.to_i, shift_data[:finish_at]['(4i)'].to_i, shift_data[:finish_at]['(5i)'].to_i)
      break_time = shift_data['break_time'].to_i
      hourly_wage = 1500 # 仮置き

      next if finish_at - start_at <= 0

      shifts << { date:, start_at:, finish_at:, break_time:, hourly_wage:, user_id: current_user.id }
    end

    Shift.insert_all(shifts)
  end

  private

    def set_year_and_month
      @year = params[:year].to_i.zero? ? this_year : params[:year].to_i
      @month = params[:month].to_i.zero? ? this_month : params[:month].to_i
    end

    def set_date
      @date = Date.new(@year, @month)
    end

    def set_shifts
      @shifts = current_user.shifts.where(date: @date.all_month).to_a
      @shifts_with_dates = @date.all_month.index_with { |date| @shifts.detect { |s| s.date == date } }
    end

    def shift_params
      params.require(:shifts).permit!
    end
end
