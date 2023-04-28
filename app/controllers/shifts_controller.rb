class ShiftsController < ApplicationController
  include Shiftable
  before_action :authenticate_user!
  before_action :set_dates
  before_action :set_shifts

  def show; end

  def edit; end

  def update
    begin
      save_shifts
    rescue ActiveRecord::RecordInvalid
      render :edit
      return
    end

    redirect_to shifts_path(year: @year, month: @month)
  end

  private

    def shift_params
      permitted_parameters = params.require(:shifts).keys.map do |key|
        { key => [
          :break_time,
          { start_at: ['(4i)', '(5i)'],
            finish_at: ['(4i)', '(5i)'] } # (1i)~(3i)は無関係なので弾く
        ] }
      end
      params.require(:shifts).permit(permitted_parameters)
    end

    def save_shifts
      ActiveRecord::Base.transaction do
        shift_params.each do |id, shift_data|
          date = Date.new(@year, @month, id.to_i)
          start_at, finish_at = build_start_and_finish_times(shift_data, date)
          break_time = shift_data['break_time'].to_i
          shift = Shift.find_or_initialize_by(date:, user_id: current_user.id)
          shift.assign_attributes(start_at:, finish_at:, break_time:, hourly_wage: 1500)
          shift.save
        end
      end
    end

    def build_start_and_finish_times(shift_data, date)
      start_at = build_datetime(date, shift_data[:start_at])
      finish_at = build_datetime(date, shift_data[:finish_at])
      [start_at, finish_at]
    end
end
